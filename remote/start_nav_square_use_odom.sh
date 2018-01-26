#!/bin/bash
this_script_dir=$(cd "$(dirname "$0")"; pwd)
source $this_script_dir/env.sh && roslaunch krb100m_nav nav_square.launch --screen
