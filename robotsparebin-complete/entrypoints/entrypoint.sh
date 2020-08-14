#!/bin/bash -ex

# Executes all tasks defined in the "tasks" directory.
# Writes log and report files to "output" directory.
python -m robot --report NONE --outputdir output --logtitle "Task log" tasks/
