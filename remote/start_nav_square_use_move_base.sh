#!/bin/bash
this_script_dir=$(cd "$(dirname "$0")"; pwd)
source $this_script_dir/env.sh && rosrun krb100m_nav move_base_square.py
