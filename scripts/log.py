from datetime import datetime
import sys


if sys.argv[1] == "in":
    print("-> in: ", datetime.now())

else:
    print("<- out:", datetime.now())
