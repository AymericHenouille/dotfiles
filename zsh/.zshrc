autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(starship completions zsh)"

FNM_PATH="/home/aymerichenouille/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --resolve-engines --shell zsh)"
  eval "$(fnm completions --shell zsh)"
fi

alias ls="ls --color=auto"
alias grep="grep --color=auto"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

