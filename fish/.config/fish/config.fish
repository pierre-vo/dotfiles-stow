set fish_greeting

fish_add_path ~/.local/bin

alias ip="ip --color"
alias gparted="sudo --preserve-env=XDG_RUNTIME_DIR,WAYLAND_DISPLAY gparted"
alias usbmount="sudo mount -o rw,gid=984,uid=1000 --target /mnt/USB"

#set MOZ_ENABLE_WAYLAND 1
set LIBVA_DRIVER_NAME nvidia
set MOZ_DISABLE_RDD_SANDBOX 1

set MOZ_ENABLE_WAYLAND 1
set XDG_SCREENSHOTS_DIR ~/Images/Screenshots
