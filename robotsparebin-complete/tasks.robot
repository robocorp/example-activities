# ## Beginners' course - complete example
#
# This example is the end result of our <a href="https://robocorp.com/docs/courses/beginners-course">beginners' course</a>.
#
# Take the course to learn all about this! :)
#

*** Settings ***
Documentation     Robot to enter weekly sales data into the RobotSpareBin Industries Intranet.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.FileSystem
Library           RPA.HTTP
Library           RPA.PDF

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
Download The Excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=True

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
Fill The Form Using The Data From The Excel File
    Open Workbook    SalesData.xlsx
    ${salesReps}=    Read Worksheet As Table    header=True
    Close Workbook
    FOR    ${salesRep}    IN    @{salesReps}
        Fill And Submit The Form For One Person    ${salesRep}
    END

*** Keywords ***
Collect The Results
    Capture Element Screenshot    css:div.sales-summary

*** Keywords ***
Export The Table As A PDF
    Wait Until Element Is Visible    id:sales-results
    ${sales_results_html}=    Get Element Attribute    id:sales-results    outerHTML
    ${directory_exists}=    Does Directory Exist    ${CURDIR}${/}output
    Run Keyword If    ${directory_exists}==False    Create directory    ${CURDIR}${/}output
    Html To Pdf    ${sales_results_html}    ${CURDIR}${/}output${/}sales_results.pdf

*** Keywords ***
Log Out And Close The Browser
    Click Button    Log out
    Close Browser

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open The Intranet Website
    Log In
    Download The Excel File
    Fill The Form Using The Data From The Excel File
    Collect The Results
    Export The Table As A PDF
    [Teardown]    Log Out And Close The Browser
