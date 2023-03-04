set -U fish_greeting

fish_add_path ~/.local/bin

alias ip="ip --color"
alias gparted="sudo --preserve-env=XDG_RUNTIME_DIR,WAYLAND_DISPLAY gparted"
alias ls='exa --header --icons --group --time-style=long-iso --git -l'
alias usbmount="sudo mount -o rw,gid=984,uid=1000 --target /mnt/USB"
alias mntNixos="sudo mount /dev/nvme0n1p8 /mnt/Nixos"

set -gx MOZ_ENABLE_WAYLAND 1
set -gx XDG_SCREENSHOTS_DIR ~/Images/Screenshots

set -gx QT_QPA_PLATFORM wayland
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx QT_PLATFORMTHEME qt5ct
set -gx QT_PLATFORM_PLUGIN qt5ct
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0
set -gx QT_SCALE_FACTOR 1

#set -x STARSHIP_CONFIG ~/.config/starship/config.toml
#set -x STARSHIP_CACHE ~/.config/starship/cache

#starship init fish | source

