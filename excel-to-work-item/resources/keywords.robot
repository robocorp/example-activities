*** Settings ***
Library     Collections
Library     OperatingSystem
Library     RPA.Excel.Files
Library     RPA.Robocloud.Items
Variables   variables.py

*** Keywords ***
Store invitations in work item
    Set Up And Validate
    ${invitations}=   Collect invitations from the Excel file
    Load Work Item From Environment
    Set Work Item Variables   invitations=${invitations}
    Save Work Item

Set Up And Validate
    File Should Exist   ${EXCEL_FILE_PATH}

Collect invitations from the Excel file
    Open Workbook      ${EXCEL_FILE_PATH}
    ${invitations}=    Read Worksheet    header=${TRUE}
    Close Workbook
    [Return]  ${invitations}
