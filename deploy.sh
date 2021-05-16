#!/bin/bash

export PATH=$PATH:/home/elliot/.local/share/gem/ruby/3.0.0/bin
echo 'PATH Exported Successfully...'

if [[ $# == 1 ]]; then
	JEKYLL_ENV=production bundle exec jekyll b -d blog
	$JEKYLL_ENV
	echo 'Production Build Completed...'
	cp CNAME blog/
	echo 'CNAME File Copied Successfully'
	cd blog
	git add .
	git commit -m "$1"
	echo 'Committing the Changes to GitHub Completed...'
	git push -u origin main
	echo 'Blog Updated Successfully...'
else
	echo "Usage: $0 'Git Commit Message'"
fi
