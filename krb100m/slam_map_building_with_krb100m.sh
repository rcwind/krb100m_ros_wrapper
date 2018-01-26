#!/bin/sh
#该脚本由krb100m机器上树莓派或者orangepi使用
this_script_dir=$(cd "$(dirname "$0")"; pwd)

#make the minimal software been launched
#tmux kill-window -t :0
#sleep 1 
sh $this_script_dir/bringup_krb100m.sh

#start gmapping_demo on the turtlebot laptop
#tmux kill-window -t :1
sleep 5
tmux new-window -k -t :1 
tmux select-window -t :1
tmux send-keys -t :1 "source $this_script_dir/env.sh" Enter
tmux send-keys -t :1 "roslaunch turtlebot_navigation gmapping_demo.launch" Enter

sleep 5
if [ $# = 0 ];then
        sleep 1
        tmux kill-window -t :2 >>/dev/null || true
        tmux new-window  -k -t :2
        tmux select-window -t :2
        tmux send-keys -t :2 "source $this_script_dir/env.sh" Enter
        tmux send-keys -t :2 "roslaunch turtlebot_rviz_launchers view_navigation.launch" Enter
fi
