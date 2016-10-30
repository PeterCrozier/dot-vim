#!/usr/bin/python

# Python 2.7

from __future__ import print_function

import sys
import re

def just(string, jtype, width):
    """Justify a string to length len according to type."""

    if jtype == '::':
        return string.center(width)
    elif jtype == '-:':
        return string.rjust(width)
    elif jtype == ':-':
        return string.ljust(width)
    else:
        return string


def normtable(text):
    """Aligns the vertical bars in a text table."""

    # Start by turning the text into a list of lines.
    lines = text.splitlines()

    # output array
    formatted = []

    # pass through any leading lines not part of table
    for line in lines:
        if '|' in line:
            break
        formatted.append(line)

    # Figure out the cell formatting.
    # First, find the separator line.
    formatline = None
    formatrow = None
    for i, rawline in enumerate(lines):
        line = rawline.strip()
        if '|' in line:
            if re.search(r"^\|?\s*:?--", line):
                formatline = line
                formatrow = i
                break

    # Delete the separator line from the content.
    if formatrow:
        del lines[formatrow]
    else:
        return "ERR: Can't find table separator"

    # Determine how each column is to be justified.
    fields = formatline.strip('|').split('|')
    justify = []
    for rawcell in fields:
        cell = rawcell.strip()
        ends = cell[0] + cell[-1]
        if ends in ['::', '-:']:
            justify.append(ends)
        else:
            justify.append(':-')

    # Assume the number of columns in the separator line is the number
    # for the entire table.
    columns = len(fields)

    # Extract the content into a matrix.
    content = []
    for line in lines:
        if '|' in line:
            cells = line.strip('| \t').split('|')
            # Put exactly one space at each end as "bumpers."
            linecontent = [" {} ".format(x.strip()) for x in cells]
            content.append(linecontent)

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
    return '\n'.join(formatted)


# Read the input, process, and print.
unformatted = unicode(sys.stdin.read(), "utf-8")
print(normtable(unformatted))

