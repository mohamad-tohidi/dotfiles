# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hitman/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/hitman/.fzf/bin"
fi

source <(fzf --zsh)
