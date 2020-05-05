*** Settings ***
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.FileSystem
Library           RPA.HTTP
Library           RPA.Tables

*** Keywords ***
Download The Challenge Excel File
    HTTP GET    ${EXCEL_FILE_URL}    ${EXCEL_FILE_PATH}

Read The Contents Of The Excel File Into A Table
    Open workbook    ${EXCEL_FILE_PATH}
    ${worksheet}=    Read worksheet    header=${TRUE}
    ${table}=    Create table    ${worksheet}
    Filter empty rows    ${table}
    Close workbook
    [Return]    ${table}

Open The Challenge Website
    Open available browser    ${CHALLENGE_URL}

Fill And Submit The Form With Data From
    [Arguments]    ${row}
    Input text    xpath://input[@ng-reflect-name="labelEmail"]    ${row.Email}
    Input text    xpath://input[@ng-reflect-name="labelPhone"]    ${row.Phone_Number}
    Input text    xpath://input[@ng-reflect-name="labelFirstName"]    ${row.First_Name}
    Input text    xpath://input[@ng-reflect-name="labelRole"]    ${row.Role_in_Company}
    Input text    xpath://input[@ng-reflect-name="labelAddress"]    ${row.Address}
    Input text    xpath://input[@ng-reflect-name="labelCompanyName"]    ${row.Company_Name}
    Input text    xpath://input[@ng-reflect-name="labelLastName"]    ${row.Last_Name}
    Click button    Submit

Take A Screenshot Of The Results
    Wait until element is visible    css=.congratulations
    Capture element screenshot    css=.congratulations    challenge-results.png
