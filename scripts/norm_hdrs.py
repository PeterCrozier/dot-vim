#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" Fixup h1 and h2 underlines """

import sys

def all_same(hline):
    """ check all characters on a line are the same and are headers """
    if hline[0] not in "=-":
        return False
    for ch in hline[1:]:
        if ch == '\n':
            break
        if ch != hline[0]:
            return False
    return True

def file_filter():
    """ read lines in, filter them for headings and write them out """
    last_line_len = 0
    for line in sys.stdin:
        if last_line_len > 0 and all_same(line):
            line = line[0] * last_line_len + '\n'
        sys.stdout.write(line)
        last_line_len = len(line) - 1

file_filter()
