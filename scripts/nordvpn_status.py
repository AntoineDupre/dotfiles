#!/usr/bin/python
import os
import sys


def write(message):
    sys.stdout.write(message)
    sys.stdout.flush()


f = os.popen("nordvpn status")
data = f.read()


def parse_status(data):
    output = ""
    if "Connected" in data:
        output += "VPN ON: "
        for line in data.split("\n"):
            if "City" in line:
                output += "{} ".format(line.split(": ")[1])
            if "IP" in line:
                output += "{} ".format(line.split(": ")[1])
        output += "\n\n#24cc1d"
        write(output)


parse_status(data)

