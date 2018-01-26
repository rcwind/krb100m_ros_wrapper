#!/bin/sh 
# usage: source setup_network_pc.sh
#IP_OF_REMOTE=`ifconfig eth0|grep 'inet add'|awk -F "[: ]" '{print $13}'`
# 用户配置这个，使用的网卡设备名字
#NET_DEV=eth0
NET_DEV=wlan0
export IP_OF_REMOTE=`ifconfig $NET_DEV |awk -F\: '/inet / {print $2}'|awk '{print $1}'`
# 用户配置这个，krb100m机器人上的树莓派或orangepi的ip地址
export IP_OF_SBC=192.168.1.104
#------------orangepi用下面这个-------------------
# 用户配置这个，krb100m机器人上的树莓派或orangepi的登录名
# export USERNAME_IN_SBC=kidil
# 用户配置这个，krb100m机器人上笔记本ssh登录后提示的信息，也即终端的输出前缀，比如[krb100m@localhost ~]，可以使用通配符
# export LOGIN_PROMPT="orangepi@host:*"
#------------树莓派用下面这个---------------------
# 用户配置这个，krb100m机器人上的树莓派或orangepi的登录名
export USERNAME_IN_SBC=kidil
# 用户配置这个，krb100m机器人上笔记本ssh登录后提示的信息，也即终端的输出前缀，比如[krb100m@localhost ~]，可以使用通配符
export LOGIN_PROMPT="orangepi@host:*"
#-------------------------------------------------

export ROS_MASTER_URI=http://$IP_OF_SBC:11311
export ROS_HOSTNAME=$IP_OF_REMOTE
