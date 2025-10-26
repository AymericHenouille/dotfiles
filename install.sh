#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(dirname "$(realpath "$0")")"
cat $DOTFILES_DIR/banner.txt

link_dotfiles() {
	local subdir="$1"
	local prefix="${2:-.}"
	local source_dir="$DOTFILES_DIR/$subdir"

	echo "-----------------------------------------"
	echo "🔗 Linking files from $source_dir → $HOME"

	if [ ! -d "$source_dir" ]; then
		echo "❌ Error: directory '$source_dir' not found"
		return 1
	fi

	for file in $source_dir/.[!.]* $source_dir/*; do
		local basename="$(basename "$file")"
		local target="$HOME/$prefix/$basename"

		if [ ! -d "$(dirname $target)" ]; then
			mkdir -p $(dirname $target)
		fi
		
		if [ -e "$file" ]; then
			if [ -L "$target" ]; then
				echo "↺ Updating symlink $target"
				ln -sf "$file" "$target"
			elif [ -e "$target" ]; then
				echo "⚠️  $target exists and is not a symlink, skipping"
			else
				ln -s "$file" "$target"
				echo "✅ Linked $target → $file"
			fi
		fi
	done
	echo " "
}

link_dotfiles "git" "."
link_dotfiles "zsh" "."
link_dotfiles "starship" ".config"
link_dotfiles "kitty" ".config/kitty"
link_dotfiles "hammerspoon" ".hammerspoon"


