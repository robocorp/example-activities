*** Settings ***
Library           Collections
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP
Library           RPA.Tables
Variables         variables.py

*** Keywords ***
Download the Excel file for the challenge
    HTTP GET    ${EXCEL_FILE_URL}    ${EXCEL_FILE_LOCAL_DOWNLOAD_PATH}

Collect people data from the Excel file
    Open Workbook    ${EXCEL_FILE_LOCAL_DOWNLOAD_PATH}
    ${worksheet}=    Read Worksheet    header=${TRUE}
    ${data_table}=    Create Table    ${worksheet}
    Filter Empty Rows    ${data_table}
    ${people}=    Create List
    FOR    ${row}    IN    @{data_table}
        ${person}=    Create Dictionary
        Set To Dictionary    ${person}    first_name    ${row.First_Name}
        Set To Dictionary    ${person}    last_name    ${row.Last_Name}
        Set To Dictionary    ${person}    company_name    ${row.Company_Name}
        Set To Dictionary    ${person}    role_in_company    ${row.Role_in_Company}
        Set To Dictionary    ${person}    address    ${row.Address}
        Set To Dictionary    ${person}    email    ${row.Email}
        Set To Dictionary    ${person}    phone_number    ${row.Phone_Number}
        Append To List    ${people}    ${person}
    END
    Close Workbook
    [Return]    ${people}

Open the RPA challenge website
    Open Available Browser    ${RPA_CHALLENGE_URL}

Fill and submit the form for one person
    [Arguments]    ${person}
    Input Text    xpath://input[@ng-reflect-name="labelEmail"]    ${person["email"]}
    Input Text    xpath://input[@ng-reflect-name="labelPhone"]    ${person["phone_number"]}
    Input Text    xpath://input[@ng-reflect-name="labelFirstName"]    ${person["first_name"]}
    Input Text    xpath://input[@ng-reflect-name="labelRole"]    ${person["role_in_company"]}
    Input Text    xpath://input[@ng-reflect-name="labelAddress"]    ${person["address"]}
    Input Text    xpath://input[@ng-reflect-name="labelCompanyName"]    ${person["company_name"]}
    Input Text    xpath://input[@ng-reflect-name="labelLastName"]    ${person["last_name"]}
    Click Button    Submit

Take screenshot of the results
    ${congratulations_element}=    Set Variable    css=.congratulations
    Wait Until Element Is Visible    ${congratulations_element}
    Capture Element Screenshot    ${congratulations_element}    challenge-results.png
