set shell := ["bash", "-uc"]

default:
  @just --list

# arch cleanup
arch_clean:
  yay -Sc


# open .justfile
nv_just:
  nvim ~/.justfile

# open sway config
nv_sway:
  nvim ~/.config/sway/config

# GIT copy branches and tags from one remote to another
git_transfert REMOTE ORIGIN='origin':
  #!/usr/bin/env bash
  git push {{REMOTE}} 'refs/remotes/{{ORIGIN}}/*:refs/heads/*'
  git push {{REMOTE}} 'refs/tags/*:refs/tags/*'

virt_setup:
  sudo usermod -aG libvirt ${USER}
  sudo usermod -aG libvirt-qemu ${USER}
  sudo usermod -aG kvm ${USER}
  sudo usermod -aG input ${USER}
  sudo usermod -aG disk ${USER}


virt_status:
  systemctl status libvirtd
  sudo virsh net-list --all

virt_start:
  sudo systemctl enable libvirtd
  sudo systemctl start libvirtd
  sudo virsh net-start default

virt_stop:
  sudo systemctl stop libvirtd
  sudo systemctl disable libvirtd

