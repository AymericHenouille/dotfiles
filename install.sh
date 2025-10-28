#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(dirname "$(realpath "$0")")"
cat $DOTFILES_DIR/banner.txt

link_dotfiles() {
	local subdir="$1"
	local prefix="${2:-.}"
	local source_dir="$DOTFILES_DIR/$subdir"

	echo "-----------------------------------------"
	echo "🔗 Linking files from $source_dir -> $HOME"

	if [ ! -d "$source_dir" ]; then
		echo "❌ Error: directory '$source_dir' not found"
		return 1
	fi

	for file in $source_dir/.[!.]* $source_dir/*; do
		local basename="$(basename "$file")"
		local target="$HOME/$prefix/$basename"

		if [ ! -e "$(dirname $target)" ]; then
			mkdir -p $(dirname $target)
		fi
		
		if [ -e "$file" ]; then
			if [ -L "$target" ]; then
				echo "↺ Updating symlink $target"
				rm -rf $target
				ln -s "$file" "$target"
			elif [ -e "$target" ]; then
				echo "⚠️ $target exists and is not a symlink, skipping"
			else
				ln -s "$file" "$target"
				echo "✅ Linked $target -> $file"
			fi
		fi
	done
	echo " "
}

link_dotfiles "git" "."
link_dotfiles "zsh" "."
link_dotfiles "starship" ".config"
link_dotfiles "kitty" ".config/kitty"
link_dotfiles "neovim" ".config/nvim"
link_dotfiles "bin" ".bin"


##############
# MACOS ONLY #
##############

if [[ "$OSTYPE" == "darwin"* ]]; then
  link_dotfiles "hammerspoon" ".hammerspoon"
  link_dotfiles "homebrew" "."

  if ! command -v brew >/dev/null 2>&1; then
    echo "-----------------------------------------"
    echo "🍺 Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew bundle --file=~/.Brewfile
fi


#############
# ARCH ONLY #
#############

if [[ "$OSTYPE" != "darwin"* ]]; then
	echo "Arch" 
fi

#############
# DEV TOOLS #
#############

if ! command -v cargo >/dev/null 2>&1; then
  echo "-----------------------------------------"
  echo "🦀 Installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  . $HOME/.zshenv
fi

if [ ! -d "$HOME/.sdkman" ]; then
  echo "-----------------------------------------"
  echo " Installing sdkman..."
  curl -s "https://get.sdkman.io" | bash
fi

if ! command -v fnm >/dev/null 2>&1; then
  echo "-----------------------------------------"
  echo "󰎙 Installing node..."
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
  eval "$(fnm env)"
fi

fnm install --lts
fnm use default
