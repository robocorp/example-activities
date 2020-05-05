*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Resource          keywords.robot

*** Variables ***
${CHALLENGE_URL}    http://rpachallenge.com/
${EXCEL_FILE_URL}    http://rpachallenge.com/assets/downloadFiles/challenge.xlsx
${EXCEL_FILE_PATH}    ${TEMPDIR}${/}challenge.xlsx

*** Tasks ***
Solve the RPA form challenge
    Download The Challenge Excel File
    ${rows}=    Read The Contents Of The Excel File Into A Table
    Remove File    ${EXCEL_FILE_PATH}
    Open The Challenge Website
    Click Button    Start
    FOR    ${row}    IN    @{rows}
        Fill And Submit The Form With Data From    ${row}
    END
    Take A Screenshot Of The Results
    [Teardown]    Close All Browsers
