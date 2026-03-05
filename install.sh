#!/usr/bin/env bash

arch_install(){
  sudo pacman -S git go base-devel
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  echo "[chaotic-aur]
	Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

	paru -S --confirm --needed hyprshot hyprpaper waybar imv mpv cliphist rofi-wayland \
		fastfetch bob tmux kitty discord spotify throne-bin zen-browser \
		nemo nemo-fileroller telegram-desktop dunst nerd-fonts nwg-look \
		pavucontrol pamixer playerctl python-gobject kvantum dunst \
		lua_language_server pyright pylint stow tree uv ollama ffmpeg \
		lazygit opencode wget curl zsh

	if [[ ! -d ~/.oh-my-zsh ]]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		/usr/bin/zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions"
		/usr/bin/zsh -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
		/usr/bin/zsh -c "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting"
	fi

	bob install nightly && bob install stable

	# mkdir -p ~/.local/share/nvim-nightly/site/pack/core/opt/blink.cmp/target/release/
	# wget -O ~/.local/share/nvim-nightly/site/pack/core/opt/blink.cmp/target/release/libblink_cmp_fuzzy.so https://github.com/saghen/blink.cmp/releases/download/v1.8.0/x86_64-unknown-linux-gnu.so
}

mac_install(){
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	  /usr/bin/zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions"
	  /usr/bin/zsh -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
	  /usr/bin/zsh -c "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting"
	fi

	# install brew
	if ! command -v brew &>/dev/null; then
	  echo "🍺 Installing Homebrew..."
	  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	# install homebrew packages
	BREW_PACKAGES=(
	  tmux
	  kitty
	  lazygit
	  keycastr
	  transmission
	  uv
	  ollama
	  ffmpeg
	  luarocks
	  tree
	  opencode
	  libpcap
	  go
	  stow
	  node
	  yarn
	  lua-language-server
	  pyright
	  pylint
	  swiftformat
	  swiftlint
	  mermaid-cli
	  asmvik/formulae/yabai
	  asmvik/formulae/skhd
	  FelixKratz/formulae/sketchybar
	  marksman
	  lua
	  switchaudio-osx
	  obs
	  chromium
	  zen
	  spotify
	  steam
	  discord
	  obsidian
	  rustdesk
	  distroav
	  font-sketchybar-app-font
	  font-maple-mono-nf
	  font-dejavu-sans-mono-nerd-font
	  font-jetbrains-mono-nerd-font
	  fastfetch
	  codex
	)

	echo "💻 Installing brew packages..."
	for pkg in "${BREW_PACKAGES[@]}"; do
	  if ! brew list "$pkg" &>/dev/null; then
	    brew install "$pkg" || echo "⚠️ Failed to install $pkg"
	  else
	    echo "✔️ $pkg is already installed"
	  fi
	done
}
# Определяем ОС
OS="$(uname)"
stow_link(){
	git clone --depth=1 https://github.com/kartavkun/dotfiles ~/.dotfiles
	cd ~/.dotfiles

	# Базовые конфиги (везде)
	APPS=("nvim-nightly" "alacritty" "kitty" "opencode" "tmux" "zsh" "scripts")

	# Конфиги только для Arch
	if [ "$OS" == "Linux" ]; then
	    APPS+=("hypr" "waybar" "rofi" "systemd")
	fi

	# Конфиги только для Mac (MacBook Air)
	if [ "$OS" == "Darwin" ]; then
	    APPS+=("sketchybar" "skhd" "yabai")
	fi

	for app in "${APPS[@]}"; do
	    echo "Stowing $app..."
	    stow -R -t "$HOME" "$app"
	done
}

if [ "$OS" == "Linux" ]; then
	arch_install()
fi

if [ "$OS" == "Darwin" ]; then
	mac_install()
fi
