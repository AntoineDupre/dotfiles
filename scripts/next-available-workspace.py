#!/usr/bin/env python

import i3
i3.command('move', 'window to workspace ' + str(max([d.get('num') for d in  i3.get_workspaces()]) +1))
