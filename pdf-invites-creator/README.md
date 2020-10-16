# PDF invites creator: multi-task robot example

Starting from an Excel file, this robot will generate a personalized PDF invitation for each participant to an event.

> You can find the full tutorial and instructions on [Robocorp's documentation site](https://robocorp.com/docs/development-howtos/pdf/pdf-invites-printer).

This robot demonstrates the advanced features of the Robocorp set of tools:

- Support for multiple tasks inside the same robot
- Using the `Robocloud.Items` library to pass data between two different tasks in Robocorp Cloud.

Running this robot locally needs some setup steps:

### Setting up the Robocloud.Items library for local use

When executing our robot in a cloud environment like [Robocorp Cloud](https://cloud.robocorp.com), the `RPA.Robocloud.Items` library will store the work item in the cloud environment, sharing its contents between steps defined in the same process, without any configuration needed.

When developing our robot and running it locally, however, we want the library to store the data in a JSON file, and provide the required parameters to simulate the cloud environment. You can learn more about the internals of the `RPA.Robocloud.Items` library [here](https://robocorp.com/docs/product-manuals/robocorp-cloud/using-robocloud-items-library).

Create a new file called `items.json` on your file system, for example, at `/Users/<username>/items.json`.

Paste this content into your `items.json` file, creating an empty but valid JSON file:

```json
{}
```

Edit the `RPA_WORKITEMS_PATH` variable in the `devdata/env.json` file to point to the `items.json` file on your filesystem. On macOS / Linux, use normal file paths, for example, `/Users/<username>/items.json`. On Windows 10, you need to escape the path, for example, `C:\\Users\\User\\items.json`.

## First task: Excel to Work Item

This robot will:

- download and collect the data from an Excel file
- process the data into the correct format
- add the data to the work item and exit

Get to the code:

[01-excel-to-work-item.robot](./01-excel-to-work-item.robot)

## Second task: work item to PDF

This robot will:

- retrieve the data from the work item
- loop through the data and generate a personalized PDF for each event participant using a template into a temporary folder
- collect all generated files into a zip archive in the output folder
- write log files
- clean up after itself by deleting the temporary folder

Get to the code:

[02-work-item-to-pdf.robot](./02-work-item-to-pdf.robot)

## `robot.yaml` configuration

For this example, the [`robot.yaml`](./robot.yaml) file has been configured to include the two tasks.

In **Robocorp Lab**, you will be able to choose which of the two tasks to run when clicking on the `Run Robot` button.

In **Robocorp Cloud**, you can select which of the two tasks you want to add to a process as a step.
