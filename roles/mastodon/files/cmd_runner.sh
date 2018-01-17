#!/bin/sh

case $1 in
	"yarn")
		yarn --pure-lockfile && \
			touch /var/www/_mastodon/.yarn-run || \
			exit 1
		;;
	"secrets")
		PAPERCLIP_SECRET=$(RAILS_ENV=production bundle24 exec rake secret)
		SECRET_KEY_BASE=$(RAILS_ENV=production bundle24 exec rake secret)
		OTP_SECRET=$(RAILS_ENV=production bundle24 exec rake secret)
		echo "PAPERCLIP_SECRET=${PAPERCLIP_SECRET}"
		echo "SECRET_KEY_BASE=${SECRET_KEY_BASE}"
		echo "OTP_SECRET=${OTP_SECRET}"
		echo ""
		touch /var/www/_mastodon/.secrets
		;;
	"pubkeys")
		VAPID=$(RAILS_ENV=production bundle24 exec rake mastodon:webpush:generate_vapid_key)
		echo "${VAPID}"
		echo ""
		touch /var/www/_mastodon/.pubkeys
		;;
	"db")
		unset CC
		unset CXX
		SAFETY_ASSURED=1 RAILS_ENV=production bundle24 exec rails db:setup && \
		touch /var/www/_mastodon/.db-run
		;;
	"cssjs")
		ulimit -n $(ulimit -Hn)
		ulimit -d $(ulimit -Hd)
		rm -rf /var/www/_mastodon/live/public/packs/*
		rm -rf /var/www/_mastodon/live/tmp/*
		RAILS_ENV=production bundle24 exec rails assets:precompile -v -t && \
		touch /var/www/_mastodon/cssjs
		;;
	*)
		exit 1
		;;
esac
