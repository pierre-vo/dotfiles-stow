#
# .zshrc - Run on interactive Zsh session.
#


# init profiling
[[ -z "$ZPROFRC" ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/pierre/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


# Clone powerlevel10k if necessary
if [[ ! -f ${ZDOTDIR}/plugins/powerlevel10k/README.md ]]; then
  command git clone https://github.com/romkatv/powerlevel10k.git ${ZDOTDIR}/plugins/powerlevel10k
fi
source ${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Clone zsh-autosuggestions if necessary
if [[ ! -f ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  command git clone https://github.com/zsh-users/zsh-autosuggestions ${ZDOTDIR}/plugins/zsh-autosuggestions
fi
source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh












# Clone zsh-syntax-highlighting if necessary, must be last
if [[ ! -f ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  command git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR}/plugins/zsh-syntax-highlighting
fi
source ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Aliases
alias ip="ip --color"
alias gparted="sudo --preserve-env=XDG_RUNTIME_DIR,WAYLAND_DISPLAY gparted"
alias ls='exa --icons'
alias ll='exa --header --icons --group --time-style=long-iso --git -l'
alias la='exa --all --header --icons --group --time-style=long-iso --git -l'
alias usbmount="sudo mount -o rw,gid=984,uid=1000 --target /mnt/USB"
alias mntNixos="sudo mount /dev/nvme0n1p8 /mnt/Nixos"

# Key binds
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# done profiling
[[ -z "$ZPROFRC" ]] || zprof

# cleanup
unset ZPROFRC zplugins
true

# vim: ft=zsh sw=2 ts=2 et

