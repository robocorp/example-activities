#!/bin/bash -ex

# Sets up chromedriver for Chrome.
webdrivermanager chrome -d temp -l bin

# Executes all tasks defined in the "tasks" directory.
# Writes log and report files to "output" directory.
robot -d output --logtitle "Task log" tasks/
