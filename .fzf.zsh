# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tae/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tae/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tae/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tae/.fzf/shell/key-bindings.zsh"
