# RPA Form challenge example robot

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

You can find more details and a full explanation of the code on [Robocorp documentation](https://robocorp.com/docs/development-howtos/browser/rpa-form-challenge)

Click the link below to get to the code:

[tasks.robot](./tasks.robot)
