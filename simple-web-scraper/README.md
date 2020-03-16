# A simple web scraper example activity

An example activity. Opens a web page and stores some content. The web page
text is stored in the "output" directory. An image screenshot is embedded in
the log.

## Setup

Install Python package dependencies:

```bash
pip install robotframework-seleniumlibrary webdrivermanager
```

## If executing in Robocode Lab (not required if executing with Robocode CLI)

```bash
webdrivermanager chrome -d temp -l bin
```

## If executing with Robocode CLI

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
