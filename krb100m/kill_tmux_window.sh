#!/bin/sh
#该脚本由krb100m机器上树莓派或者orangepi使用
tmux kill-window -t :0 >>/dev/null || true
tmux kill-window -t :1 >>/dev/null || true
