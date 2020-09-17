# Work item to PDF example robot

This robot is meant to be used in combination with the `excel-to-work-item` robot, as the second step of a process to print PDF invitations starting from an Excel file.

This robot will:

- retrieve the data from the work item
- loop through the data and generate a personalized PDF for each event participant using a template into a temporary folder
- collect all generated files into a zip archive in the output folder
- write log and report files
- clean up after itself by deleting the temporary folder

## Setting up the Robocloud.Items library for local use

When executing our robot in a cloud environment like [Robocorp Cloud](https://cloud.robocorp.com), the `RPA.Robocloud.Items` library will store the work item in the cloud environment, sharing its contents between robots defined in the same process, without any configuration needed.

When developing our robot and running it locally, however, we want the library to store the data in a JSON file, and provide the required parameters to simulate the cloud environment. You can learn more about the internals of the `RPA.Robocloud.Items` library [here](https://hub.robocorp.com/resources/libraries/rpaframework-Robocloud-Items/).

**If you have executed the first robot (`excel-to-work-item`), you will already have a `items.json` file on your filesystem that you can reuse here. If you have not, you can find a copy in the `/devdata` folder.**

Edit the `RPA_WORKITEMS_PATH` variable to point to the `items.json` file on your filesystem. On macOS / Linux, use normal file paths,
for example, `/Users/<username>/items.json`. On Windows 10, you need to escape the path, for example, `C:\\Users\\User\\items.json`.

> By pointing to the same file that we used in the first robot and by specifying the same workspace and work item id, we are now effectively sharing data between the two robots. This way, we are simulating what happens in [Robocorp Cloud](https://cloud.robocorp.com) when two robots are added to the same process.

## Expected results of the robot

After you run the robot, you will find a zip archive `PDFs.zip` file in the `temp/robocode/work-item-to-pdf/output` directory, or the `output` directory if executing the example robot in Robocorp Lab in Notebook mode.

Extract it and you will see the PDF invitations according to the data in the Excel file.
