*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP 


*** Keyword ***
Get The List Of People From The Excel File
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=${TRUE}
    Close Workbook
    [Return]    ${table}


*** Keyword ***
Fill And Submit The Form
    [Arguments]    ${person}  
    Input Text    css:input[ng-reflect-name="labelFirstName"]  ${person}[First Name]
    Input Text    css:input[ng-reflect-name="labelLastName"]  ${person}[Last Name]
    Input Text    css:input[ng-reflect-name="labelCompanyName"]  ${person}[Company Name]
    Input Text    css:input[ng-reflect-name="labelRole"]  ${person}[Role in Company]
    Input Text    css:input[ng-reflect-name="labelAddress"]  ${person}[Address]
    Input Text    css:input[ng-reflect-name="labelEmail"]  ${person}[Email]
    Input Text    css:input[ng-reflect-name="labelPhone"]  ${person}[Phone Number]
    Click Button    Submit


*** Task ***
Start The Challenge
    Open Available Browser    http://rpachallenge.com/
    Download  http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    overwrite=${TRUE}
    Click Button    Start


*** Task ***
Fill The Forms
    ${people}=    Get The List Of People From The Excel File
    FOR  ${person}  IN  @{people}
      Fill And Submit The Form  ${person}
    END


*** Task ***
Collect The Results
    Capture Element Screenshot    css:div.congratulations
    [Teardown]  Close All Browsers
