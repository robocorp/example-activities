## Dialogs Upload File Example Robot

# This robot demonstrates the use of the [`RPA.Dialogs`](https://robocorp.com/docs/libraries/rpa-framework/rpa-dialogs) library allow the user to choose and upload an Excel file,
# which is then used by the robot to fill a form in a web application.

*** Settings ***
Documentation     Example robot to illustrate how to upload a file using the RPA.Dialogs library.
...               Collects an Excel file from the user and uses it to fill in the form at the
...               RobotSpareBin Industries Inc. intranet.
Library           RPA.Dialogs
Library           RPA.Browser
Library           RPA.Excel.Files

*** Keywords ***
Collect Excel File From User
    Create Form    Upload Excel File
    Add File Input    label=Upload the Excel file with sales data
    ...    name=fileupload
    ...    element_id=fileupload
    ...    filetypes=application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
    ...    target_directory=${CURDIR}${/}output
    &{response}    Request Response
    [Return]    ${response["fileupload"][0]}

*** Keywords ***
Open The Intranet Website
    Open Available Browser    https://robotsparebinindustries.com/

*** Keywords ***
Log In
    Input Text    id:username    maria
    Input Password    id:password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form

*** Keywords ***
Fill And Submit The Form For One Person
    [Arguments]    ${salesRep}
    Input Text    firstname    ${salesRep}[First Name]
    Input Text    lastname    ${salesRep}[Last Name]
    Input Text    salesresult    ${salesRep}[Sales]
    ${target_as_string}=    Convert To String    ${salesRep}[Sales Target]
    Select From List By Value    salestarget    ${target_as_string}
    Click Button    Submit

*** Keywords ***
Fill The Form Using The Data From An Excel File
    [Arguments]    ${excel_file_path}
    Open Workbook    ${excel_file_path}
    ${salesReps}=    Read Worksheet As Table    header=True
    Close Workbook
    FOR    ${salesRep}    IN    @{salesReps}
        Fill And Submit The Form For One Person    ${salesRep}
    END

*** Keywords ***
Collect The Results
    Screenshot    css:div.sales-summary    ${CURDIR}${/}output${/}sales_summary.png

*** Keywords ***
Log Out And Close The Browser
    Click Button    Log out
    Close Browser

*** Tasks ***
Fill Robot Sparebin Intranet Sales Data From Excel File Provided By User
    ${excel_file_path}=    Collect Excel File From User
    Open The Intranet Website
    Log In
    Fill The Form Using The Data From An Excel File    ${excel_file_path}
    Collect The Results
    [Teardown]    Log Out And Close The Browser
