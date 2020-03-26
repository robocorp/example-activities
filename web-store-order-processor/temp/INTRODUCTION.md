# Temporary files

Temporary files should be placed in this directory, and they should never be
included in the package. By default, this directory is in .gitignore file.

Robocode local run uses this directory as a working directory by default.

If you remove this directory from the activity directory structure, you must
provide the `--workarea` argument to Robocode CLI run command.
