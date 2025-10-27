autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(starship completions zsh)"

eval "$(fnm env --use-on-cd --resolve-engines --shell zsh)"
eval "$(fnm completions --shell zsh)"

alias ls="ls --color=auto"
alias grep="grep --color=auto"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
