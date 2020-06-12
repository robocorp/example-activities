# RPA Form challenge example activity

This robot will solve the form challenge posted at http://rpachallenge.com.

The challenge consists of downloading an Excel spreadsheet, extracting the data from it and filling the form on the website with the data for ten times.

More in detail, when run, this robot will:

- download the test Excel file from the rpachallenge.com website
- collect the data from the downloaded Excel file
- start the challenge clicking on the Start button
- loop through the data and fill the forms for 10 times
- take a screenshot of the results page
- write log and report files
- close the browser

You can find more details and a full explanation of the code on Robohub: https://hub.robocorp.com/knowledge-base/tutorials/rpa-form-challenge-tutorial/

## Executing with Robocode Lab

Robocode Lab will take care of setting up the environment for you, so you do not need to run additional installation commands.

You can choose to run the activity in Robocode Lab in two different modes, using the _Activity run_ functionality or in _Notebook mode_.

> Visit Robohub to learn more about [running your activities in Robocode Lab](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/).

### Running with Activity Run

Click the `Run activity` button in the top right corner in the UI.
Select the entry point from the provided list: use `entrypoint.sh` on macOS/Linux and `entrypoint.cmd` on Windows.

### Running in Notebook mode

Navigate to the `tasks` directory and double-click the `robot.robot` file to open it in Notebook mode.

Click the `>>` icon or press `Ctrl+Shift+Enter` (Windows) or `Shift-Command-Enter` (macOS) and click `Restart` to run the robot.

> You can also find the run command from the menu on the top of Robocode Lab screen, by selecting `Run` -> `Restart Kernel and Run All Cells...`.

> In Notebook mode you can also run only part of an activity step by step. Check [this article on Robohub](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/) for more information.

## Executing with Robocode CLI

> Assumes `robocode` is installed. Install with `pip install robocode`.

Install Python package dependencies:

```bash
pip install rpaframework
```

Create an executable package:

```bash
robo wrap
```

Execute the activity using the local environment variables file:

Windows:

```bash
robo run entrypoint.cmd -v devdata\env.json
```

macOS / Linux:

```bash
robo run entrypoint.sh -v devdata/env.json
```
