# ## Writing excel file example
# This simple robot shows how to use the `RPA.Excel.Files` library to write to a local Excel file.
#
# > You can find the full tutorial and instructions on [Robocorp's documentation site](https://robocorp.com/docs/development-howtos/excel/writing-excel-files-tutorial).
#
# In Robocorp Lab, click on the `>>` button above to run the whole example, or you can execute each cell by using the `>` button.

*** Settings ***
Documentation     An example robot that downloads JSON data from a remote API
...               and writes it into a local Excel file.
Library           RPA.Excel.Files
Library           RPA.HTTP

*** Tasks ***
Create an Excel file with data from a remote API
    Create Workbook    comments.xlsx
    Set Worksheet Value    1    1    Post ID
    Set Worksheet Value    1    2    ID
    Set Worksheet Value    1    3    Name
    Set Worksheet Value    1    4    Email address
    Set Worksheet Value    1    5    Body
    ${response}=    Http Get    https://jsonplaceholder.typicode.com/comments
    Append Rows To Worksheet    ${response.json()}
    Save Workbook
