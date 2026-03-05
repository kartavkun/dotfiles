#!/bin/bash
set -e

INPUT_DEVICE="alsa_input.pci-0000_09_00.3.analog-stereo"
OUTPUT_DEVICE="alsa_output.usb-MV-SILICON_F998_20190808-00.analog-stereo"

### --- UNLOAD СТАРОГО ---

# Удаляем loopback'и
pactl list short modules \
  | awk '/module-loopback/ {print $1}' \
  | xargs -r pactl unload-module

# Удаляем конкретные null-sink'и по имени
for SINK in VirtualCable Virtual_Another_Cable; do
  pactl list short modules \
    | awk -v sink="$SINK" '$0 ~ "module-null-sink" && $0 ~ sink {print $1}' \
    | xargs -r pactl unload-module
done

### --- СОЗДАНИЕ ---

# Virtual cables
pactl load-module module-null-sink \
  sink_name=VirtualCable \
  sink_properties=device.description="Virtual_Audio_Cable"

pactl load-module module-null-sink \
  sink_name=Virtual_Another_Cable \
  sink_properties=device.description="Another_Virtual_Audio_Cable"

# Mic -> Another
pactl load-module module-loopback \
  source="$INPUT_DEVICE" \
  sink=Virtual_Another_Cable \
  latency_msec=1

# VirtualCable -> Another
pactl load-module module-loopback \
  source=VirtualCable.monitor \
  sink=Virtual_Another_Cable \
  latency_msec=1

# VirtualCable -> Headphones
pactl load-module module-loopback \
  source=VirtualCable.monitor \
  sink="$OUTPUT_DEVICE" \
  latency_msec=1
