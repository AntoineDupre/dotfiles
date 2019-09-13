#!/usr/bin/env python

import i3

# figure out what is on, and what is currently on your screen.
focused_workspace = list(filter(lambda s: s['focused'], i3.get_workspaces()))[0]
outputs = list(filter(lambda s: s['active'], i3.get_outputs()))

# find the index of the currently focused workspace
currentIndex = 0
for i, output in enumerate(outputs):
    if output['name'] == focused_workspace['output']:
        currentIndex = i
        break

# find the next workspace
nextIndex = currentIndex + 1
if nextIndex >= len(outputs):
    nextIndex = 0
other_workspace = outputs[nextIndex]

# send current to the no-active one
i3.command('move', 'workspace to output '+other_workspace['name'])
