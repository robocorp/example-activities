# Work item to PDF example robot

This robot is meant to be used in combination with the `excel-to-work-item` robot, as the second step of a process to print PDF invitations starting from an Excel file.

This robot will:

- retrieve the data from the work item
- loop through the data and generate a personalized PDF for each event participant using a template into a temporary folder
- collect all generated files into a zip archive in the output folder
- write log and report files
- clean up after itself by deleting the temporary folder

## Setup

Install Python package dependencies:

```bash
pip install --upgrade rpaframework robotframework-archivelibrary
```

## Setting up the Robocloud.Items library for local use

When executing our robot in a cloud environment like [Robocorp Cloud](https://cloud.robocorp.com), the `RPA.Robocloud.Items` library will store the work item in the cloud environment, sharing its contents between robots defined in the same process, without any configuration needed.

When developing our robot and running it locally, however, we want the library to store the data in a JSON file, and provide the required parameters to simulate the cloud environment. You can learn more about the internals of the `RPA.Robocloud.Items` library [here](https://hub.robocorp.com/resources/libraries/rpaframework-Robocloud-Items/).

**If you have executed the first robot (`excel-to-work-item`), you will already have a `items.json` file on your filesystem that you can reuse here. If you have not, you can find a copy in the `/devdata` folder.**

Edit the `RPA_WORKITEMS_PATH` variable to point to the `items.json` file on your filesystem. On macOS / Linux, use normal file paths,
for example, `/Users/<username>/items.json`. On Windows 10, you need to escape the path, for example, `C:\\Users\\User\\items.json`.

> By pointing to the same file that we used in the first robot and by specifying the same workspace and work item id, we are now effectively sharing data between the two robots. This way, we are simulating what happens in [Robocorp Cloud](https://cloud.robocorp.com) when two robots are added to the same process.

## Executing with Robocorp CLI

> Assumes `robocode` is installed. Install with `pip install --upgrade robocode`.

Create an executable package:

```bash
robo wrap
```

Execute the robot using the local environment variables file:

Windows:

```bash
robo run entrypoint.cmd -v devdata\env.json
```

macOS / Linux:

```bash
robo run entrypoint.sh -v devdata/env.json
```

## Executing with Robocorp Lab

Robocorp Lab will take care of setting up the environment for you, so you do not need to run additional installation commands.

You can choose to run the robot in Robocorp Lab in two different modes, using the _Activity run_ functionality or in _Notebook mode_.

> Visit Robocorp documentation to learn more about [running your robots in Robocorp Lab](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/).

### Running with Activity Run

Click the `Run activity` button in the top right corner in the UI.
Select the entry point from the provided list: use `entrypoint.sh` on macOS/Linux and `entrypoint.cmd` on Windows.

### Running in Notebook mode

Navigate to the `tasks` directory and double-click the `robot.robot` file to open it in Notebook mode.

Click the `>>` icon or press `Ctrl+Shift+Enter` (Windows) or `Shift-Command-Enter` (macOS) and click `Restart` to run the robot.

> You can also find the run command from the menu on the top of Robocorp Lab screen, by selecting `Run` -> `Restart Kernel and Run All Cells...`.

> In Notebook mode, you can also run only part of the robot step by step. Check [this article in Robocorp documentation](https://hub.robocorp.com/knowledge-base/articles/running-robots-in-robocode-lab/) for more information.

## Expected results of the robot

After you run the robot, you will find a zip archive `PDFs.zip` file in the `temp/robocode/work-item-to-pdf/output` directory, or the `output` directory if executing the example robot in Robocorp Lab in Notebook mode.

Extract it and you will see the PDF invitations according to the data in the Excel file.
