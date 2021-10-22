#!/bin/bash

export PATH=$PATH:/home/$USER/.local/share/gem/ruby/3.0.0/bin
# export PATH=$PATH:/home/elliot/.local/share/gem/ruby/3.0.0/bin
green="\e[1;32m"
reset="\e[0m"
echo -e "[$green+$reset] PATH Exported Successfully..."

if [[ $# == 1 ]]; then
	JEKYLL_ENV=production bundle exec jekyll b -d blog
	$JEKYLL_ENV
	echo -e "[$green+$reset] Production Build Completed..."
	cp CNAME blog/
	echo -e "[$green+$reset] CNAME File Copied Successfully..."
	cd blog
	git add .
	git commit -m "$1"
	echo -e "[$green+$reset] Committing the Changes to GitHub Completed..."
	git push -u origin main
	echo -e "[$green+$reset] Blog Updated Successfully..."
	cd ..
	git add . && git commit -m '$1' && git push -u origin main
	echo -e "[$green+$reset] Backup Completed..."
else
	echo "Usage: $0 'Git Commit Message'"
fi
