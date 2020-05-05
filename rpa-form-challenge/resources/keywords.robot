*** Settings ***
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.FileSystem
Library           RPA.HTTP
Library           RPA.Tables

*** Keywords ***
Download the challenge Excel file
    HTTP GET    ${EXCEL_FILE_URL}    ${EXCEL_FILE_PATH}

Read the contents of the Excel file into a table
    Open workbook    ${EXCEL_FILE_PATH}
    ${worksheet}=    Read worksheet    header=${TRUE}
    ${table}=    Create table    ${worksheet}
    Filter empty rows    ${table}
    Close workbook
    [Return]    ${table}

Open the challenge website
    Open available browser    ${CHALLENGE_URL}

Fill and submit the form with data from
    [Arguments]    ${row}
    Input text    xpath://input[@ng-reflect-name="labelEmail"]    ${row.Email}
    Input text    xpath://input[@ng-reflect-name="labelPhone"]    ${row.Phone_Number}
    Input text    xpath://input[@ng-reflect-name="labelFirstName"]    ${row.First_Name}
    Input text    xpath://input[@ng-reflect-name="labelRole"]    ${row.Role_in_Company}
    Input text    xpath://input[@ng-reflect-name="labelAddress"]    ${row.Address}
    Input text    xpath://input[@ng-reflect-name="labelCompanyName"]    ${row.Company_Name}
    Input text    xpath://input[@ng-reflect-name="labelLastName"]    ${row.Last_Name}
    Click button    Submit

Take a screenshot of the results
    Wait until element is visible    css=.congratulations
    Capture element screenshot    css=.congratulations    challenge-results.png
