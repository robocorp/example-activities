#!/bin/bash -ex

# Executes all tasks defined in the "tasks" directory.
# Writes log and report files to "output" directory.
python -m robot -d output --logtitle "Task log" tasks/
