# Setup fzf
# ---------
if [[ ! "$PATH" == */home/malik/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/malik/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/malik/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/malik/.fzf/shell/key-bindings.zsh"
