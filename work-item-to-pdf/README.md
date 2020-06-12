# Work item to PDF example activity

This activity is meant to be used in combination with the `excel-to-work-item` activity, as the second step of a process to print PDF invitations starting from an Excel file.

In this second activity the robot will:

- retrieve the data from the work item
- loop through the data and generate a personalized PDF for each event participant using a template into a temporary folder
- collect all generated files into a zip archive in the output folder
- write log and report files
- clean up after itself by deleting the temporary folder

## Setup

Install Python package dependencies:

```bash
pip install rpaframework robotframework-archivelibrary
```

## Setting up the Robocloud.Items library for local use

When executing our robot in a cloud environment like [Robocloud](https://cloud.robocorp.com), the `RPA.Robocloud.Items` library will store the work item in the cloud environment, sharing its contents between activities defined in the same process, without any configuration needed.

When developing our activity and running it locally, however, we want the library to store the data in a JSON file, and provide the required parameters to simulate the cloud environment. You can learn more about the internals of the `RPA.Robocloud.Items` library [here](https://hub.robocorp.com/resources/libraries/rpaframework-Robocloud-Items/).

**If you have executed the first activity (`excel-to-work-item`), you will already have a `items.json` file on your filesystem that you can reuse here. If you have not, you can find a copy in the `/devdata` folder.**

Edit the `RPA_WORKITEMS_PATH` variable to point to the `items.json` file on your filesystem. On macOS / Linux, use normal file paths,
for example, `/tmp/items.json`. On Windows 10, you need to escape the path, for example, `C:\\Users\\User\\items.json`.

> By pointing to the same file that we used in the first activity and by specifying the same workspace and work item id, we are now effectively sharing data between the two activities. This way, we are simulating what happens in [Robocloud](https://cloud.robocorp.com) when two activities are added to the same process.

## Executing with Robocode CLI

> Assumes `robocode` is installed. Install with `pip install robocode`.

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

## Expected results of the activity

After you run the robot, you will find a zip archive `PDFs.zip` file in the `temp/robocode/work-item-to-pdf/output` directory, or the `output` directory if executing the example activity in Robocode Lab in notebook mode.

Extract it and you will see the PDF invitations according to the data in the Excel file.
