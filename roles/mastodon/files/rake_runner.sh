#!/bin/sh

case $1 in
	"db")
		SAFETY_ASSURED=1 RAILS_ENV=production bundle24 exec rails db:setup && \
		touch /var/www/_mastodon/db
		;;
	"cssjs")
		ulimit -n $(ulimit -Hn)
		ulimit -d $(ulimit -Hd)
		RAILS_ENV=production bundle24 exec rails assets:precompile ; \
		touch /var/www/_mastodon/cssjs
		;;
	*)
		exit 1
		;;
esac
