#!/bin/bash
this_script_dir=$(cd "$(dirname "$0")"; pwd)
source $this_script_dir/env.sh
# 用户配置该变量值挂载其他目录
mount_src_dir=/home/$USERNAME_IN_SBC
mount_dst_dir=$IP_OF_SBC
mkdir -p ~/$mount_dst_dir
sshfs $USERNAME_IN_SBC@$IP_OF_SBC:$mount_src_dir ~/$mount_dst_dir
