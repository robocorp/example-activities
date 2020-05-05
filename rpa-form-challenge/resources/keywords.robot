*** Settings ***
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.FileSystem
Library           RPA.HTTP

*** Keywords ***
Download The Challenge Excel File
    Download    ${EXCEL_FILE_URL}    ${EXCEL_FILE_PATH}    overwrite=${TRUE}

Read The Contents Of The Excel File Into A Table
    Open Workbook    ${EXCEL_FILE_PATH}
    ${worksheet}=    Read Worksheet As Table    header=${TRUE}    trim=${TRUE}
    Close Workbook
    [Return]    ${worksheet}

Open The Challenge Website
    Open Available Browser    ${CHALLENGE_URL}

Fill And Submit The Form With Data From
    [Arguments]    ${row}
    Input Text    xpath://input[@ng-reflect-name="labelEmail"]    ${row.Email}
    Input Text    xpath://input[@ng-reflect-name="labelPhone"]    ${row.Phone_Number}
    Input Text    xpath://input[@ng-reflect-name="labelFirstName"]    ${row.First_Name}
    Input Text    xpath://input[@ng-reflect-name="labelRole"]    ${row.Role_in_Company}
    Input Text    xpath://input[@ng-reflect-name="labelAddress"]    ${row.Address}
    Input Text    xpath://input[@ng-reflect-name="labelCompanyName"]    ${row.Company_Name}
    Input Text    xpath://input[@ng-reflect-name="labelLastName"]    ${row.Last_Name}
    Click Button    Submit

Take A Screenshot Of The Results
    Wait Until Element Is Visible    css=.congratulations
    Capture Element Screenshot    css=.congratulations    challenge-results.png
