alias ls='ls --color=auto -G'
alias ll='ls -lah'

alias afind='ack -il'

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

alias k='kubectl'
alias emacs='emacs -nw'
alias matterhorn='matterhorn -c $HOME/.config/matterhorn/conf.ini -f markdown'

gc::swp() {
  if [[ $# == 0 ]]; then
    echo dir: $HOME/tmp $HOME/go $HOME/pjts
    find $HOME/tmp $HOME/go $HOME/pjts -type f -name '*.swp' -exec echo "remove {}" \; -exec rm -rf {} \;
  else
    local target=$1
    echo dir: $target
    find $target -type f -name '*.swp' -exec echo "remove {}" \; -exec rm -rf {} \;
  fi
}

fpre() {
  fzf --preview 'bat --style=numbers --color=always {} | head -500'
}


ksync() {
  if [[ $# == 0 ]]; then
    echo usage: ksync serverIP;
    return -1
  fi
  local server serverConfig
  server=$1
  serverConfig=$HOME/.kube/config-$server
  echo "[INFO] $server sync..."
  scp root@$server:~/.kube/config $serverConfig
  if [[ ! -f "$serverConfig" ]]; then
    echo "server kubeconfig not exist"
    return -1
  fi

  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/kubernetes-admin/$server-user/g" $serverConfig
    sed -i '' "s/kubernetes$/c-$server/g" $serverConfig
  else
    sed -i "s/kubernetes-admin/$server-user/g" $serverConfig
    sed -i "s/kubernetes$/c-$server/g" $serverConfig
  fi
}


klog() {
  if [[ $# < 2 ]]; then
    echo usage: klog namespace selector other...;
    return -1
  fi
  local ns selector name
  ns=$1
  selector=$2
  name=$(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}")

  kubectl -n $ns logs $name ${@:3}
}

kexec() {
  if [[ $# < 2 ]]; then
    echo usage: kexec namespace selector script(default: sh);
    return -1
  fi
  local ns selector name script
  ns=$1
  selector=$2
  name=$(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}")
  script=sh
  if [[ ! -z "$3" ]]; then
    script=$3
  fi

  kubectl -n $ns exec -it $name -- $script
}

ktoken() {
  if [[ $# != 2 ]]; then
    echo usage: ktoken namespace serviceAccount;
    return -1
  fi
  local ns sa secret
  ns=$1
  sa=$2
  secret=`kubectl -n $ns get sa $sa -o jsonpath='{.secrets[0].name}'`

  kubectl -n $ns get secret $secret -o jsonpath={.data.token} | base64 -d
}
