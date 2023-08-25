#! /usr/bin/env sh

# copied from https://gitlab.com/jokeyrhyme/dotfiles/-/blob/main/usr/local/bin/dotfiles-sway.sh
# see: https://man.sr.ht/~kennylevinsen/greetd/#how-to-set-xdg_session_typewayland

set -eu

export XDG_CURRENT_DESKTOP=Hyprland # xdg-desktop-portal
export XDG_SESSION_DESKTOP=Hyprland # systemd
export XDG_SESSION_TYPE=wayland # xdg/systemd

if command -v dbus-update-activation-environment >/dev/null; then
  dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
fi
# without this, systemd starts xdg-desktop-portal without these environment variables,
# and the xdg-desktop-portal does not start xdg-desktop-portal-wrl as expected
# https://github.com/emersion/xdg-desktop-portal-wlr/issues/39#issuecomment-638752975
systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

# use systemd-run here, because systemd units inherit variables from ~/.config/environment.d
# shellcheck disable=SC2068
systemd-run --quiet --unit=Hyprland --user --wait Hyprland $@
#systemctl --user stop sway-session.target

# this teardown makes it easier to switch between compositors
unset DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
systemctl --user unset-environment DISPLAY SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
if command -v dbus-update-activation-environment >/dev/null; then
  dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
fi

