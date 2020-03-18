#!/bin/bash -ex

# Installs a driver for Chrome.
webdrivermanager chrome -d temp -l bin

# Executes all tasks defined in the "tasks" directory.
# Writes log and report files to "output" directory.
robot -d output --logtitle "Task log" tasks/
