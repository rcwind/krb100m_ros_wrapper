#!/bin/bash
this_script_dir=$(cd "$(dirname "$0")"; pwd)
source $this_script_dir/env.sh
#make the minimal software been launched
ssh $USERNAME_IN_KRB100M@$IP_OF_KRB100M
