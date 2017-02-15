#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    Layout a markdown table in canonical form justifying all the columns.
    Assumes stdin contains only the table with maybe some leading or trailing blank lines.
    Outputs the new table to stdout.
"""
# incase we are using Python 2.7 by default
from __future__ import print_function

import sys
import re

def just(string, jtype, width):
    """Justify a string to length len according to type."""

    if jtype == ':-' or jtype == '--':
        return string.ljust(width)
    elif jtype == '::':
        return string.center(width)
    elif jtype == '-:':
        return string.rjust(width)
    else:
        return string


def normtable(text):
    """ Aligns the vertical bars in a text table """

    # Start by turning the text into a list of lines.
    lines = text.splitlines()

    # output array
    formatted = []

    # pass through any leading lines not part of table, i.e. no pipe
    leading = 0
    for line in lines:
        if '|' in line:
            break
        formatted.append(line)
        leading += 1

    # Found heading line, figure out the cell formatting.
    # First, find the separator line.
    formatline = None
    formatrow = None
    for i, rawline in enumerate(lines[leading:]):
        line = rawline.strip()
        if '|' in line:
            if re.search(r"\s*:?-+:?\s*\|", line):
                formatline = line
                formatrow = leading + i
                break

    # Delete the separator line from the content.
    if formatrow != None:
        del lines[formatrow]
    else:
        return "ERR: Can't find table heading separator"

    # Determine how each column is to be justified.
    fields = formatline.strip('|').split('|')
    justify = []
    for rawcell in fields:
        cell = rawcell.strip()
        ends = cell[0] + cell[-1]
        if ends in ['::', '-:']:
            justify.append(ends)
        else:
            justify.append('--')

    # Assume the number of columns in the separator line is the number
    # for the entire table.
    columns = len(fields)

    # Extract the content into a matrix.
    content = []
    trailing = []
    for line in lines[leading:]:
        if '|' in line:
            cells = line.strip('|').split('|')
            # Put exactly one space at each end as "bumpers."
            linecontent = [" {} ".format(x.strip()) for x in cells]
            content.append(linecontent)
        else:
            trailing.append(line)

    # Append empty cells to rows that don't have enough.
    for i, row in enumerate(content):
        while len(row) < columns:
            content[i].append('')

    # Get the width of the content in each column. The minimum width will
    # be 2, because that's the shortest length of a formatting string and
    # because that matches an empty column with "bumper" spaces.
    widths = [2] * columns
    for row in content:
        for i in range(columns):
            widths[i] = max(len(row[i]), widths[i])

    # Add whitespace to make all the columns the same width and
    for row in content:
        formatted.append('|' + '|'.join([just(s, t, n) for (s, t, n) in zip(row, justify, widths)]) + '|')

    # Recreate the format line with the appropriate column widths.
    formatline = '|' + '|'.join([s[0] + '-'*(n-2) + s[-1] for (s, n) in zip(justify, widths)]) + '|'

    # Insert the formatline back into the table.
    formatted.insert(formatrow, formatline)

    # Return the formatted table.
    return '\n'.join(formatted + trailing)


# Read the input, process, and print.
print(normtable(sys.stdin.read()))

