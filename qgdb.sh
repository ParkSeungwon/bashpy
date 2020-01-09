#!/bin/bash

tmux select-window -t g2
tmux send-keys -t 0 C-c
tmux send-keys -t 1 C-c
tmux send-keys -t 2 C-c
tmux send-keys -t 3 C-c

tmux select-window -t g1
tmux send-keys -t 2 C-c
tmux send-keys -t 3 C-c
tmux send-keys -t 4 C-c

tmux select-window -t g2
tmux send-keys -t 0 exit ENTER
tmux send-keys -t 1 exit ENTER
tmux send-keys -t 2 exit ENTER
tmux send-keys -t 3 exit ENTER

tmux select-window -t g1
tmux send-keys -t 2 exit ENTER
tmux send-keys -t 3 exit ENTER
tmux send-keys -t 4 exit ENTER

kill -9 `ps ax | grep "gdb -tui" | (read -a ID; echo ${ID[0]})`
tmux send-keys -t 0 exit ENTER
tmux send-keys -t 1 exit ENTER

