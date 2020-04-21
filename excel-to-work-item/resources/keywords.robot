*** Settings ***
Library     Collections
Library     OperatingSystem
Library     RPA.Excel.Files
Library     RPA.Robocloud.Items
Library     RPA.Tables
Variables   variables.py

*** Keywords ***
Store invitations in work item
    Set up and validate
    ${invitations}=   Collect invitations from the Excel file
    Load Work Item From Environment
    Set Work Item Variables   invitations=${invitations}
    Save Work Item
    [Teardown]

Set up and validate
    File Should Exist   ${EXCEL_FILE_PATH}

Collect invitations from the Excel file
    Open Workbook           ${EXCEL_FILE_PATH}
    ${worksheet}=           Read Worksheet  header=${TRUE}
    ${invitations_table}=   Create Table    ${worksheet}
    ${invitations}=         Create List

    FOR   ${row}  IN  @{invitations_table}
        ${invitation}=      Create Dictionary
        Set To Dictionary   ${invitation}   first_name  ${row.first_name}
        Set To Dictionary   ${invitation}   last_name   ${row.last_name}
        Set To Dictionary   ${invitation}   address     ${row.address}
        Set To Dictionary   ${invitation}   city        ${row.city}
        Set To Dictionary   ${invitation}   date        ${row.date}
        Set To Dictionary   ${invitation}   time        ${row.time}

        Append To List      ${invitations}  ${invitation}
    END

    Close Workbook
    [Return]  ${invitations}