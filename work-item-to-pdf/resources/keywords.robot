*** Settings ***
Library     RPA.PDF
Library     RPA.Robocloud.Items
Library     OperatingSystem
Library     ArchiveLibrary
Variables   variables.py

*** Keywords ***
Process invitations
    Set up and validate
    ${invitations}=    Collect invitations from work item

    FOR     ${invitation}  IN  @{invitations}
        Run Keyword And Continue On Failure    Create PDF file for invitation    ${invitation}
    END

    Create ZIP Package from PDF files

    [Teardown]   Cleanup temporary PDF directory

Set up and validate
    File Should Exist       ${PDF_TEMPLATE_PATH}
    Create directory        ${PDF_TEMP_OUTPUT_DIRECTORY}
    
Collect invitations from work item
    Load Work Item From Environment
    ${invitations}=    Get Work Item Variable  invitations
    [Return]    ${invitations}

Create PDF file for invitation
    [Arguments]                     ${invitation}
    Template HTML to PDF   ${PDF_TEMPLATE_PATH}  ${PDF_TEMP_OUTPUT_DIRECTORY}/${invitation["first_name"]}_${invitation["last_name"]}.pdf  ${invitation}

Create ZIP Package from PDF files
    ${zipfilename}=    set variable     ${OUTPUT_DIRECTORY}/PDFs.zip
    Create zip from Files in directory    ${PDF_TEMP_OUTPUT_DIRECTORY}    ${zipfilename}

Cleanup temporary PDF directory
    Remove Directory    ${PDF_TEMP_OUTPUT_DIRECTORY}  True