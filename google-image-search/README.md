# Google image search example activity

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

## Executing with Robocode Lab

Robocode Lab will take care of setting up the environment for you, so you do not need to run additional installation commands.

You can choose to run the activity in Robocode Lab in two different modes, using the _Activity run_ functionality or in _Notebook mode_.

> For more information about running your activities in Robocode Lab, check [this article on Robohub](https://hub.robocorp.com/development/robocode-documentation/running-robots-in-robocode-lab).

### Running with Activity Run

Click the `Run activity` button in the top right corner in the UI.
Select the entry point from the provided list: use `entrypoint.sh` on macOS/Linux and `entrypoint.cmd` on Windows.

### Running in Notebook mode

Navigate to the tasks folder and open the `robot.robot` file in Notebook mode by right-clicking the file and selecting `Open With` -> `Notebook`.

Press `Ctrl+Shift+Enter` (Windows) or `Shift-Command-Enter` (macOS) and click Restart to run the robot.

> You can also find the run command from the menu on the top of Robocode Lab screen, by selecting `Run` -> `Restart Kernel and Run All Cells...`.

> In Notebook mode you can also run only part of an activity step by step. Check [this article on Robohub](https://hub.robocorp.com/development/robocode-documentation/running-robots-in-robocode-lab) for more information.
