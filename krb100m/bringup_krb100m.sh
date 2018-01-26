#!/bin/bash
#该脚本由krb100m机器上树莓派或者orangepi使用
this_script_dir=$(cd "$(dirname "$0")"; pwd)
setup_base_path=$this_script_dir/../setup

tmux new-window -k -t :0
tmux select-window -t :0

sleep 1

tmux send-keys -t :0 "source $this_script_dir/env.sh" Enter
#tmux send-keys -t :0 "source $setup_base_path/setup_base.sh" Enter
tmux send-keys -t :0 "roslaunch krb100m_bringup krb100m_core.launch --screen" Enter

