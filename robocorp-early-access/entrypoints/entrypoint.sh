#!/bin/bash -ex

# Executes all tasks defined in the "tasks" directory.
# Writes output to "output" directory.
robot -d output --logtitle "Task log" tasks/
