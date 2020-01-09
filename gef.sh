#!/bin/bash

#tmux new-window -n "g1"
tmux split-window -h

tmux send-keys -t 0 "gdb $*" ENTER
tmux send-keys -t 1 "tty > /tmp/tty.gef" ENTER
sleep .5
TTYF=`cat /tmp/tty.gef`
tmux send-keys -t 0 "dashboard registers -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard memory -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard threads -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard variables -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard stack -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard expressions -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard history -output $TTYF" ENTER
tmux send-keys -t 0 "dashboard assembly -output $TTYF" ENTER
#tmux send-keys -t 0 "dashboard assembly -style height 30" ENTER
tmux send-keys -t 0 "dashboard source -style height 30" ENTER
tmux send-keys -t 0 "dashboard -layout breakpoints source assembly registers variables history expressions threads stack memory" ENTER
#tmux select-window -t g1
tmux select-pane -t 0 
#tmux send-keys -t 0 "start" ENTER
