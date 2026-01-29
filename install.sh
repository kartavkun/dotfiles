#/bin/bash

run_script(){
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

  git clone --depth 1 https://github.com/kartavkun/dotfiles ~/.dotfiles
	cd ~/.dotfiles
	stow .


}

if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "arch" || "$ID_LIKE" == *"arch"* ]]; then
        run_script
    else
        echo "Why you try to use this script on not Arch-based distro???"
        exit 1
    fi
else
    echo "idk what is your distro, sorry..."
    exit 1
fi
