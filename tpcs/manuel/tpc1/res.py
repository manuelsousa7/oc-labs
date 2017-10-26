#!/usr/bin/python

import sys
res = []

def solve1(NUM,VAR1,VAR2,VAR3):
	res += []


def solve(NUM,VAR1,VAR2,VAR3):
	solve1(NUM,VAR1,VAR2,VAR3)

if(len(sys.argv)!=2):
	print("you must use is like this: python res.py YOURFUCKINGNUMBER")
	sys.exit()

NUM = int(sys.argv[1])
VAR1 = NUM % 1000
VAR2 = int(str(NUM)[:2])
VAR3 = VAR1 + VAR2
print VAR1,VAR2,VAR3


solve(NUM,VAR1,VAR2,VAR3)
