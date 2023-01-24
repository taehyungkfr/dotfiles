##############################################################################
# Oh my zsh
##############################################################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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
alias p='sudo podman'


##############################################################################
# Env
##############################################################################
export TMPDIR=/tmp
export GOPATH="$HOME/go"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export EDITOR=vim
export SYSTEMD_EDITOR=vim

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # export GDK_SCALE=2
  # export GDK_DPI_SCALE=2

  # ibus
  export GTK_IM_MODULE=ibus
  export XMODIFIERS=@im=ibus
  export QT_IM_MODULE=ibus

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
  export GIT_EDITOR=emacsclient
  export KUBE_EDITOR=emacsclient
fi

export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor/' -g '!.git/'"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

##############################################################################
# Extension
##############################################################################
[[ -f ~/.custom.sh ]] && source ~/.custom.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.zfunc ]] && source ~/.zfunc
[[ -f /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
