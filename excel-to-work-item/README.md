# Excel to work item example activity

This activity is meant to be used in combination with the `work-item-to-pdf` activity, as the first step of a process to print PDF invitations starting from an Excel file.

In this first activity the robot will:

- collect the data from an Excel file
- process the data into the correct format
- add the data to the work item and exit

## Setup

Install Python package dependencies:

```bash
pip install rpaframework
```

## Setting up the Robocloud.Items library for local use

When executing our robot in a cloud environment like [Robocloud](https://cloud.robocorp.com), the `RPA.Robocloud.Items` library will store the work item in the cloud environment, sharing its contents between activities defined in the same process, without any configuration needed.

When developing our activity and running it locally, however, we want the library to store the data in a JSON file, and provide the required parameters to simulate the cloud environment. You can learn more about the internals of the `RPA.Robocloud.Items` library [here](https://hub.robocorp.com/resources/libraries/rpaframework-Robocloud-Items/).

Create a new file called `items.json` on your file system, for example at `/tmp/items.json`.

Paste this content into your `items.json` file, creating an empty but valid json file:

```json
{}
```

Edit the `RPA_WORKITEMS_PATH` variable to point to the `items.json` file on your filesystem. On macOS / Linux, use normal file paths,
for example, `/tmp/items.json`. On Windows 10, you need to escape the path, for example, `C:\\Users\\User\\items.json`.

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

After running the activity, your `items.json` file should have been filled with the data from the provided Excel file:

```json
{
  "1": {
    "1": {
      "variables": {
        "invitations": [
          {
            "first_name": "Reynard",
            "last_name": "Mouse",
            "address": "4 Service Center",
            "city": "Toronto",
            "date": "2019/07/03",
            "time": "10:00 PM"
          },
          {
            "first_name": "Elisabeth",
            "last_name": "Kilfoyle",
            "address": "197 Ronald Regan Drive",
            "city": "New York",
            "date": "2019/05/03",
            "time": "10:20 PM"
          },
          {
            "first_name": "Cyril",
            "last_name": "Blundon",
            "address": "3554 Chive Circle",
            "city": "San Francisco",
            "date": "2019/05/10",
            "time": "1:33 PM"
          },
          {
            "first_name": "Vincenz",
            "last_name": "Paolazzi",
            "address": "20533 6th Crossing",
            "city": "Milan",
            "date": "2019/12/14",
            "time": "6:58 AM"
          },
          {
            "first_name": "Jeannie",
            "last_name": "Charge",
            "address": "9 Michigan Street",
            "city": "Kansas City",
            "date": "2020/02/12",
            "time": "4:27 AM"
          },
          {
            "first_name": "Alexio",
            "last_name": "Hellis",
            "address": "8 Grim Trail",
            "city": "Lahore",
            "date": "2019/05/05",
            "time": "5:04 PM"
          },
          {
            "first_name": "Luca",
            "last_name": "Viel",
            "address": "91764 Reindahl Park",
            "city": "New Dehli",
            "date": "2019/12/17",
            "time": "8:37 AM"
          },
          {
            "first_name": "Sly",
            "last_name": "Lammerts",
            "address": "8077 Pennsylvania Drive",
            "city": "Helsinki",
            "date": "2020/02/09",
            "time": "11:23 PM"
          },
          {
            "first_name": "Leah",
            "last_name": "Mithun",
            "address": "3619 Oxford Place",
            "city": "Stockholm",
            "date": "2019/10/30",
            "time": "1:15 PM"
          },
          {
            "first_name": "Maridel",
            "last_name": "Sneezum",
            "address": "4 Cambridge Center",
            "city": "London",
            "date": "2020/03/26",
            "time": "11:24 AM"
          }
        ]
      }
    }
  }
}
```
