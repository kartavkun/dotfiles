#!/usr/bin/env bash

arch_install(){
  sudo pacman -S --needed git go base-devel
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  
  # Проверяем, нет ли уже записи о chaotic-aur
  if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  fi

  sudo pacman -Sy --confirm --needed hyprshot hyprpaper waybar imv mpv cliphist rofi-wayland \
      fastfetch bob tmux kitty discord spotify throne-bin zen-browser \
      nemo nemo-fileroller telegram-desktop dunst nerd-fonts nwg-look \
      pavucontrol pamixer playerctl python-gobject kvantum \
      lua-language-server pyright pylint stow tree uv ollama ffmpeg \
      lazygit opencode wget curl zsh paru

  install_omz
  bob install nightly && bob install stable
}

mac_install(){
  # install brew
  if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  BREW_PACKAGES=(
    tmux kitty lazygit keycastr transmission uv ollama ffmpeg luarocks tree 
    opencode libpcap go stow node yarn lua-language-server pyright pylint 
    swiftformat swiftlint mermaid-cli yabai skhd sketchybar marksman lua 
    switchaudio-osx obs chromium zen spotify steam discord obsidian 
    rustdesk distroav font-sketchybar-app-font font-maple-mono-nf 
    font-dejavu-sans-mono-nerd-font font-jetbrains-mono-nerd-font fastfetch codex
  )

  echo "💻 Installing brew packages..."
  brew install "${BREW_PACKAGES[@]}" # Brew сам пропустит установленные

  install_omz
}

install_omz(){
  if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Installer: Setting up Oh My Zsh..."
    # Флаг --unattended предотвращает запуск новой ZSH сессии и остановку скрипта
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  # Клонируем плагины (с проверкой на существование папки)
  ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
  mkdir -p "$ZSH_CUSTOM/plugins"
  
  [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]] && git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  [[ ! -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]] && git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
}

stow_link(){
  # Если папка уже есть, просто заходим в неё и пуллим изменения
  if [ -d "$HOME/.dotfiles" ]; then
    cd "$HOME/.dotfiles" && git pull
  else
    git clone --depth=1 https://github.com/kartavkun/dotfiles ~/.dotfiles
    cd ~/.dotfiles
  fi

  APPS=("nvim-nightly" "alacritty" "kitty" "opencode" "tmux" "zsh" "scripts")
  [[ "$OS" == "Linux" ]] && APPS+=("hypr" "waybar" "rofi" "systemd")
  [[ "$OS" == "Darwin" ]] && APPS+=("sketchybar" "skhd" "yabai")

  for app in "${APPS[@]}"; do
    if [ -d "$app" ]; then
      echo "Stowing $app..."
      stow -R -v -t "$HOME" "$app"
    fi
  done
}

OS="$(uname)"
case "$OS" in
  "Linux")  arch_install ;;
  "Darwin") mac_install  ;;
  *) echo "Unknown OS"; exit 1 ;;
esac

stow_link
echo "✅ Setup complete!"
