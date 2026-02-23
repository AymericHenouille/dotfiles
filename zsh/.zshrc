autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(starship completions zsh)"

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --resolve-engines --shell zsh)"
  eval "$(fnm completions --shell zsh)"
fi

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ssh="kitten ssh"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


if command -v fastfetch >/dev/null 2>&1; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    image="$HOME/.local/share/fastfetch/apple.png"
  else
    image="$HOME/.local/share/fastfetch/arch.png"
  fi

  fastfetch
fi
