import fileinput

for line in fileinput.input():
    print(line.split(" - ")[0])

