#!/bin/bash
conky -c ~/.conky/myown/cpu 2> /dev/null &
conky -c ~/.conky/myown/network 2> /dev/null &
conky -c ~/.conky/myown/process 2> /dev/null &
conky -c ~/.conky/myown/date 2> /dev/null &
conky -c ~/.conky/myown/machine 2> /dev/null &
conky -c ~/.conky/myown/task 2> /dev/null &
conky -c ~/.conky/myown/beamline 2> /dev/null &
