# Robocorp early access example activity

Executes Google image search and stores the first result image.

## Setup

Install Python package dependencies:

```bash
pip install rpa-framework
```

## Executing with Robocode CLI

> Assumes `robocode` is installed. Install with `pip install robocode`.

Create an executable package:

```bash
robo wrap
```

Execute the activity:

Windows:

```bash
robo run entrypoint.cmd
```

macOS / Linux:

```bash
robo run entrypoint.sh
```
