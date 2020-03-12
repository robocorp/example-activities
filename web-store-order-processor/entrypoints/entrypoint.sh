#!/bin/bash -ex

# Executes all tasks defined in the "tasks" directory.
# Writes log and report files to "../output" directory.
# Adds "libraries", "resources" and "variables" directories to Python path.
webdrivermanager chrome -d temp -l bin
robot -d output --logtitle "Task log" tasks/
