# ## PDF invite creator
# ### Part 1: Excel To Work Item
#
# This example is explained in detail <a href="https://robocorp.com/docs/development-howtos/pdf/pdf-invites-printer">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the <a href="https://robocorp.com/docs/development-howtos/pdf/pdf-invites-printer">example page</a> for details!**
#

*** Settings ***
Documentation     Excel reader robot. Reads information from a given Excel file
...               and adds it to the work item.
Library           RPA.Excel.Files
Library           RPA.Robocloud.Items

*** Variables ***
${EXCEL_FILE_PATH}=    ${CURDIR}${/}devdata${/}Data.xlsx

*** Keywords ***
Collect invitations from the Excel file
    Open Workbook    ${EXCEL_FILE_PATH}
    ${invitations}=    Read Worksheet    header=True
    Close Workbook
    [Return]    ${invitations}

*** Tasks ***
Read invitations from Excel file and add them to the work item
    ${invitations}=    Collect invitations from the Excel file
    Set Work Item Variables    invitations=${invitations}
    Save Work Item
