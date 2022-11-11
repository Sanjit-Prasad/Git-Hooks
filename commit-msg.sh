#!/usr/bin/env python

import sys
import os
import re
from subprocess import check_output

# Collect the parameters
commit_msg_filepath = sys.argv[1]

# Figure out which branch we're on
branch = check_output(['git', 'symbolic-ref', '--short', 'HEAD']).strip()
print "commit-msg: On branch '%s'" % branch

# Check the commit message if we're on an ENG branch
result = re.match('ENG-(.*)', branch)
required_message = "ENG-"

with open(commit_msg_filepath, 'r') as f:
    content = f.read()
    if not content.startswith(required_message):
        print "[ERROR] commit-msg: The commit message must start with '%s'" % required_message
        sys.exit(1)
