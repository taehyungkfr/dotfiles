export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor/' -g '!.git/' -g '!node_modules/' -g '!target/'"
export TMPDIR=/tmp
export GOPATH="$HOME/go"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export GOROOT="/usr/local/go"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export LANG=ko_KR.UTF-8
  export GOROOT="/usr/local/opt/go/libexec"
  export JAVA_HOME=/usr/local/opt/openjdk/libexec/openjdk.jdk
  export PATH=$PATH:/Applications/Firefox.app/Contents/MacOS
else
  # Unknown.
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  export KUBE_EDITOR="emacsclient"
fi

# Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# Krew
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
