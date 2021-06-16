#!/bin/python

# * : is for declaring aliases for terminal
# * > is for declaring aliases for browser

from subprocess import run, PIPE


def getProgramOutput(program: str):
    program_s = program[2:].split()
    p = run(program_s, capture_output=True, encoding="ascii")
    return p.stdout


fp = open("/home/liz/.config/myLazyrc", "r")
lines = fp.read().split("\n")

if lines[0].startswith("$"):
    program = lines[0][1:].split()
else:
    program = ["dmenu"]

keyLines = [line for line in lines if line.startswith(":") or line.startswith(">")]

keyDict = {keyLine[1:].strip(): keyLine for keyLine in keyLines}

keyList = "\n".join(keyDict.keys())
p = run(program, capture_output=True, input=keyList, encoding="ascii")
selected = p.stdout[:-1]
keyLine = keyDict.get(selected)

if keyLine not in list(keyLines):
    print("Bad key")
    exit(1)

pos = lines.index(keyLine) + 1
output = ""

while pos < len(lines) and lines[pos].strip() != "":
    line = lines[pos]
    if line.startswith("%%"):
        output += f"\n{getProgramOutput(line)}"
    else:
        output += f"\n{line}"
    pos += 1

if keyLine.startswith(">"):
    output = output.replace("\n", "\r\n")

run(["xdotool", "type", "--clearmodifiers", "--delay", "0", output])
