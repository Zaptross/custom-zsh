#!/bin/zsh

updeb () {
	downloadsDir="$HOME/Downloads"
	suffix=".deb"

	for input in $@; do
		## Find the latest versioned DEB file in the Downloads folder
		latestDeb=$(ls -t "$downloadsDir/$input"*"$suffix" 2>/dev/null | head -n1)

		if [[ -z "$latestDeb" ]]; then
			echo "No $input DEB file found in $downloadsDir"
		else
			echo "Found latest $input DEB file: $latestDeb"
			sudo dpkg -i "$latestDeb" && rm $latestDeb && echo "Successfully removed $latestDeb"
		fi
	done
}