#!/bin/sh
set -e # exit if error found

if [ ! -f Gemfile ]; then
	echo "Gemfile not present. Can't build jekyll site."
	exit 1
fi

bundle install # install gems
exec "$@"
