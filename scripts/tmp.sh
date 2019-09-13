#!/bin/bash
((/usr/bin/pavucontrol -t 3 --name "pavucontrol-bar" || true) && $HOME/scripts/volume_control.py signal) || $HOME/scripts/volume_control.py signal ; $HOME/scripts/volume_control.py i3blocks
