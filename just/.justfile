set shell := ["bash", "-uc"]

default:
  @just --list

virt_setup:
  sudo usermod -aG libvirt ${USER}

virt_status:
  systemctl status libvirtd

virt_start:
  sudo systemctl enable libvirtd
  sudo systemctl start libvirtd

virt_stop:
  sudo systemctl stop libvirtd
  sudo systemctl disable libvirtd

