# ## PDF Invite printer
# ### Part1: Excel To Work Item
#
# This example is explained in detail <a href="https://robocorp.com/docs/development-howtos/pdf/pdf-invites-printer">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the <a href="https://robocorp.com/docs/development-howtos/pdf/pdf-invites-printer">example page</a> for details!**
#

*** Settings ***
Documentation     Excel reader robot. Reads information from a given Excel file and
...               adds it to the work item.
Library           RPA.Excel.Files
Library           RPA.HTTP
Library           RPA.Robocloud.Items

*** Variables ***
${EXCEL_FILE_NAME}=    Data.xlsx
${EXCEL_FILE_URL}=    https://github.com/robocorp/example-activities/raw/master/excel-to-work-item/devdata/${EXCEL_FILE_NAME}

*** Keywords ***
Store invitations in work item
    Download    ${EXCEL_FILE_URL}    overwrite=True
    ${invitations}=    Collect invitations from the Excel file
    Set Work Item Variables    invitations=${invitations}
    Save Work Item

*** Keywords ***
Collect invitations from the Excel file
    Open Workbook    ${EXCEL_FILE_NAME}
    ${invitations}=    Read Worksheet    header=True
    Close Workbook
    [Return]    ${invitations}

*** Tasks ***
Read invitations from Excel file and add them to the work item
    Store invitations in work item
