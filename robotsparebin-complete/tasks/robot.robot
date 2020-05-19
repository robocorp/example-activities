*** Settings ***
Documentation     Robot to enter weekly sales data into the RobotSpareBin Industries Intranet.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.FileSystem
Library           RPA.HTTP
Library           RPA.PDF

*** Keywords ***
Open The Intranet And Log In
    Open Available Browser    https://robotsparebinindustries.com/
    Input Text    id:username    maria
    Input Password    id:password    thoushallnotpass
    Submit Form
    Wait Until Page Contains Element    id:sales-form

*** Keywords ***
Download The Excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=${TRUE}

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
    ${salesReps}=    Read Worksheet As Table    header=${TRUE}
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
    ${sales_table_element}=    Get WebElement    id:sales-results
    ${sales_table_html}=    Catenate    <h2>Sales results for this week!</h2><table>    ${sales_table_element.get_attribute("innerHTML")}    </table>
    Create File    sales_results.template    ${sales_table_html}    overwrite=True
    Template Html To Pdf    sales_results.template    sales_results.pdf

*** Keywords ***
Log Out And Close The Browser
    Click button    Log out
    Close Browser

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open The Intranet And Log In
    Download The Excel File
    Fill The Form Using The Data From The Excel File
    Collect The Results
    Export The Table As A PDF
    [Teardown]    Log Out And Close The Browser
