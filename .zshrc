export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh 

files=(
  $HOME/.fzf.zsh
  $HOME/.aliases.sh
  $HOME/.envs.sh
  $HOME/.p10k.zsh
  $HOME/.etc.sh
)

for v in $files[@]; do
  [[ -f $v ]] && source $v
done

[[ -f /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
