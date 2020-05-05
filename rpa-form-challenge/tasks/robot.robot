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
    Download the challenge Excel file
    ${rows}=    Read the contents of the Excel file into a table
    Remove File    ${EXCEL_FILE_PATH}
    Open the challenge website
    Click button    Start
    FOR    ${row}    IN    @{rows}
        Fill and submit the form with data from    ${row}
    END
    Take a screenshot of the results
    [Teardown]    Close all browsers
