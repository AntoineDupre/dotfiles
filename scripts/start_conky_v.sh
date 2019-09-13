#!/bin/bash
conky -c ~/.conky/myown_v/cpu 2> /dev/null &
conky -c ~/.conky/myown_v/network 2> /dev/null &
conky -c ~/.conky/myown_v/process 2> /dev/null &
conky -c ~/.conky/myown_v/date 2> /dev/null &
conky -c ~/.conky/myown_v/machine 2> /dev/null &
conky -c ~/.conky/myown_v/task 2> /dev/null &
conky -c ~/.conky/myown_v/beamline 2> /dev/null &
conky -c ~/.conky/myown_v/machine_n 2> /dev/null &
conky -c ~/.conky/myown_v/beamline_n 2> /dev/null &
