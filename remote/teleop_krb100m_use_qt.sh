#!/bin/bash
#该脚本由krb100m机器上笔记本使用
this_script_dir=$(cd "$(dirname "$0")"; pwd)
file_prefix=bringup_krb100m
source $this_script_dir/env.sh
#make the minimal software been launched
ssh -t $USERNAME_IN_KRB100M@$IP_OF_KRB100M "sh /home/$USERNAME_IN_KRB100M/krb100m_ros_wrapper/krb100m/kill_tmux_window.sh"
#launch_cmd="$this_script_dir/expect/$file_prefix.expect $IP_OF_KRB100M $USERNAME_IN_krb100m $LOGIN_PROMPT"
launch_cmd="$this_script_dir/krb100m.expect $IP_OF_KRB100M $USERNAME_IN_KRB100M $LOGIN_PROMPT $file_prefix 1"
sleep 1
tmux kill-window -t :0 >>/dev/null || true
tmux new-window -k -t :0 "$launch_cmd"
tmux select-window -t :0

#start rviz already configured to visualize the robot and its sensor's output
sleep 8
tmux kill-window -t :1 >>/dev/null || true
tmux new-window  -k -t :1
tmux select-window -t :1
tmux send-keys -t :1 "source $this_script_dir/env.sh" Enter
tmux send-keys -t :1 "rqt_remocon" Enter

tmux select-window -t :0

