autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(starship completions zsh)"

alias ls="ls --color=auto"
alias grep="grep --color=auto"
