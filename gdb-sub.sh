#!/bin/bash

tmux new-window -n "g1"
tmux split-window -h
tmux split-window -v
tmux split-window -h
tmux split-window -v

tmux send-keys -t 0 "gdb -tui $1" ENTER
tmux send-keys -t 1 "tty > /tmp/tty.tmux" ENTER
tmux send-keys -t 2  "voltron v cmd 'info locals'" ENTER
tmux send-keys -t 3  "voltron v b" ENTER
tmux send-keys -t 4  "voltron v bt" ENTER

tmux new-window -n "g2"
tmux split-window -v
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h
tmux resize-pane -t 0 -x 25
tmux send-keys -t 0 "voltron v r" ENTER
tmux send-keys -t 1 "voltron v st" ENTER
tmux send-keys -t 2 "voltron v disasm" ENTER
tmux send-keys -t 3 "voltron v cmd 'display'" ENTER

tmux select-window -t g1
tmux select-pane -t 0

sleep .5
tmux send-keys -t 0 "tty `cat /tmp/tty.tmux`" ENTER
tmux send-keys -t 0 "b main" ENTER
#tmux send-keys -t 0 "r" ENTER
#tmux send-keys -t 0 "d 1" ENTER
#sleep 1
#tmux send-keys -t 0 "n" ENTER
