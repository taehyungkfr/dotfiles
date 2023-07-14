##############################################################################
# Oh my zsh
##############################################################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

##############################################################################
# Alias
##############################################################################
alias ls='ls --color=auto --group-directories-first --time-style=long-iso'
alias ll='ls -lah'
alias afind='ack -il'
alias grep='grep --color=auto --exclude-dir={.bzr,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,.git,.hg,.svn,.idea,.tox}'
alias k='kubectl'
alias p='podman'


##############################################################################
# Env
##############################################################################
export TMPDIR=/tmp
export GOPATH="$HOME/go"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export EDITOR=vim

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # export GDK_SCALE=2
  # export GDK_DPI_SCALE=2

  # fcitx
  export GTK_IM_MODULE=fcitx
  export QT_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx

  export LC_CTYPE=ko_KR.UTF-8

  export GOROOT="/usr/local/go"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export LANG=ko_KR.UTF-8
  export GOROOT="/usr/local/opt/go/libexec"
  export JAVA_HOME=/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home

  PATH=$PATH:/Applications/Firefox.app/Contents/MacOS
  PATH=$PATH:/Applications/Emacs.app/Contents/Info.plist
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  export EDITOR=emacsclient
fi

export GIT_EDITOR=$EDITOR
export KUBE_EDITOR=$EDITOR
export SYSTEMD_EDITOR=vim

export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor/' -g '!.git/'"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:${KREW_ROOT:-$HOME/.krew}/bin

##############################################################################
# Extension
##############################################################################
[[ -f ~/.custom.sh ]] && source ~/.custom.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.zfunc ]] && source ~/.zfunc
[[ -f /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
[[ -f /usr/local/bin/minikube ]] && source <(minikube completion zsh)
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
