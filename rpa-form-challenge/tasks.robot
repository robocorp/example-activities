# ## RPA Form Challenge example
#
# Run this example to solve the form challenge at http://rpachallenge.com/.
#
# Get the full tutorial and explanation <a href="https://robocorp.com/docs/development-howtos/browser/rpa-form-challenge">on our site</a>.
#
# In Robocorp Lab, click on the `>>` button above to run the whole example, or you can execute each cell by using the `>` button.
#

*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP

*** Keywords ***
Get The List Of People From The Excel File
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${table}

*** Keywords ***
Set Value By Xpath
    [Arguments]    ${xpath}    ${value}
    ${result}=    Execute Javascript    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.value='${value}';
    [Return]    ${result}

*** Keywords ***
Fill And Submit The Form
    [Arguments]    ${person}
    Set Value By Xpath    //input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
    Set Value By Xpath    //input[@ng-reflect-name="labelAddress"]    ${person}[Address]
    Set Value By Xpath    //input[@ng-reflect-name="labelEmail"]    ${person}[Email]
    Set Value By Xpath    //input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
    Click Button    Submit

*** Tasks ***
Start The Challenge
    Open Available Browser    http://rpachallenge.com/
    Download    http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    overwrite=True
    Click Button    Start

*** Tasks ***
Fill The Forms
    ${people}=    Get The List Of People From The Excel File
    FOR    ${person}    IN    @{people}
        Fill And Submit The Form    ${person}
    END

*** Tasks ***
Collect The Results
    Capture Element Screenshot    css:div.congratulations
    Close All Browsers
