#!/bin/bash -ex

# Writes log and report files to "output" directory.
python -m robot --report NONE --outputdir output --logtitle "Task log" tasks.robot
