# Google image search example robot

Executes Google image search and stores the first result image.

## Setup

Install Python package dependencies:

```bash
pip install --upgrade rpaframework
```

## Executing with Robocorp CLI

> Assumes `robocode` is installed. Install with `pip install --upgrade robocode`.

Create an executable package:

```bash
robo wrap
```

Execute the robot:

Windows:

```bash
robo run entrypoint.cmd
```

macOS / Linux:

```bash
robo run entrypoint.sh
```

## Executing with Robocorp Lab

Robocorp Lab will take care of setting up the environment for you, so you do not need to run additional installation commands.

You can choose to run the robot in Robocorp Lab in two different modes, using the _Activity run_ functionality or in _Notebook mode_.

> Visit Robocorp documentation to learn more about [running your robots in Robocorp Lab](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/).

### Running with Activity Run

Click the `Run activity` button in the top right corner in the UI.
Select the entry point from the provided list: use `entrypoint.sh` on macOS/Linux and `entrypoint.cmd` on Windows.

### Running in Notebook mode

Navigate to the `tasks` directory and double-click the `.robot` file to open it in Notebook mode.

Click the `>>` icon or press `Ctrl+Shift+Enter` (Windows) or `Shift-Command-Enter` (macOS) and click `Restart` to run the robot.

> You can also find the run command from the menu on the top of Robocorp Lab screen, by selecting `Run` -> `Restart Kernel and Run All Cells...`.

> In Notebook mode, you can also run only part of the robot step by step. Check [this article in Robocorp documentation](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/) for more information.
