# Temporary files

Temporary files should be placed in this directory, and they should never be
included in the package. By default, this directory is in .gitignore file.

Robocode local run also uses this directory as working directory by default.
So if you remove it from activity directory structure, you must provide
--workarea argument to CLI run command.