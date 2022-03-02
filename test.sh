#!/bin/bash

# Setup a work space called `WEBRTC` with 5 windows 1-2-2
# first window has 1 pane.
# The first pane set at 65%, split vertically, set to root and running vim
# pane 2 is split vertically at 25% and 50% horizontally running `npm run watch/styles`
# pane 3 is split vertically at 25% and 50% horizontally running `npm run watch/scripts`
# pane 3 is split vertically at 10% and 50% horizontally running `npm run watch/templates`
# pane 4 is split vertically at 10% and 50% horizontally running `npm run watch/browser`
# note: `api` aliased to `cd ~/path/to/work`

session=ANDROID

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n '🕶️ devPunks'

# # Select pane 1 run vim
#tmux select-pane -t :0
tmux send-keys "pwd; vim -c 'NERDTree'" C-m
#tmux split-window -t 0 -v -p 70 -c "$(pwd)"

# Split pane 1 vertically by 70%
tmux split-window -t 0 -h -p 30 -c "$(pwd)"
tmux select-pane -t 1
tmux send-keys "git status" C-m # watch/styles

tmux split-window -t 1 -v -p 30 -c "$(pwd)"
tmux select-pane -t 2
# tmux send-keys "pwd" C-m # watch/templates

# tmux split-window -t 1 -h -p 40 -c "$(pwd)"
# tmux select-pane -t 3
# tmux send-keys "pwd" C-m # watch/scripts

# tmux split-window -t 2 -h -p 40 -c "$(pwd)"
# tmux select-pane -t 4
# tmux send-keys "pwd" C-m # watch/browser

tmux -2 attach -t $session