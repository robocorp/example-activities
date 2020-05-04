*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Resource          keywords.robot

*** Tasks ***
Solve the RPA form challenge
    Download the Excel file for the challenge
    ${people}=    Collect people data from the Excel file
    Open the RPA challenge website
    Click Button    Start
    FOR    ${person}    IN    @{people}
        Run Keyword And Continue On Failure    Fill and submit the form for one person    ${person}
    END
    Take screenshot of the results
    [Teardown]    Close Browser
