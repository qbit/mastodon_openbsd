#!/bin/sh

session='mastodon'
counter=1

cd /var/www/_mastodon/live
tmux -2 new-session -d -s "${session}"

tmux split-window -p 70
tmux send-keys "RAILS_ENV=production PORT=3000 bundle24 exec puma -C config/puma.rb" C-m
tmux split-window -h -p 70
tmux select-pan -t 2
tmux send-keys "RAILS_ENV=production DB_POOL=5 bundle24 exec sidekiq -c 5 -q default -q mailers -q pull -q push" C-m
tmux split-window -h -p 70
tmux select-pan -t 3
tmux send-keys "NODE_ENV=production PORT=4000 npm run start" C-m

tmux -2 attach-session -t "${session}"
tmux select-layout main-horizontal
