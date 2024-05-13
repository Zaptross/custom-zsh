#!/bin/zsh

updeb () {
	downloadsDir="$HOME/Downloads"
	suffix=".deb"

	## Find the latest versioned DEB file in the Downloads folder
	latestDeb=$(ls -t "$downloadsDir/$1"*"$suffix" 2>/dev/null | head -n1)

	if [[ -z "$latestDeb" ]]; then
		echo "No $1 DEB file found in $downloadsDir"
	else
		echo "Found latest $1 DEB file: $latestDeb"
		sudo dpkg -i "$latestDeb" && rm $latestDeb && echo "Successfully removed $latestDeb"
	fi
}
