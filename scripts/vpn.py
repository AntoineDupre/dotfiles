#!/usr/bin/python
import os
import sys


def write(message):
  sys.stdout.write(message)
  sys.stdout.flush()


f = os.popen("nmcli -t connection show --active")
data = f.read()

if "vpn" in data:
    write("VPN ON\n\n#24cc1d")


