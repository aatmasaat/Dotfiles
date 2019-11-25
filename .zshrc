export PATH=$PATH:$HOME/Scripts
export WORKON_HOME="$HOME/.virtualenvs"
export EDITOR=vim

autoload -U colors && colors
PS1="%B%{$fg[green]%}[%{$fg[green]%}%n%{$fg[green]%}@%{$fg[green]%}%M %{$fg[red]%}%~%{$fg[green]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Vim mode:
bindkey -v
export KEYTIMEOUT=1

# Aliases:
alias ls='ls --color=auto'
alias la='ls -lAh'
alias ll='ls -lh'
alias v='vim'
alias t='tmux'
alias yt='youtube-dl'
alias img='sxiv -f'
alias tp='trash-put'
alias history='history 1'
alias list_device='simple-mtpfs -l'
alias mount_device='simple-mtpfs --device 1 Mobile/'
alias unmount_device='fusermount -u Mobile/'
alias ev='v ~/.vimrc'
alias ez='v ~/.zshrc'
alias et='v ~/.tmux.conf'
alias se='du -a ~/Scripts/* ~/Documents/* ~/.config/* | awk "{print \$2}" | fzf | xargs -r -o $EDITOR'

# System Information
neofetch

# Execute the contents of the files:
source /usr/bin/virtualenvwrapper.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
