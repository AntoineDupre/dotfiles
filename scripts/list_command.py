with open("/home/antdup/.zshrc", 'r') as fp:
    for line in fp.readlines():
        if "!-!" in line:
            input = line.split("!-!")[-1].strip()
            cmd, desc = input.split(" - ")
            print("{:<30} - {}".format(cmd, desc))
