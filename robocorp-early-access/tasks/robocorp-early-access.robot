*** Settings ***
Documentation   Executes Google image search and stores the first result image.
Library         RPA.Browser

*** Variables ***
${GOOGLE_URL}=      https://google.com/?hl=en
${SEARCH_TERM}=     cat picture

*** Tasks ***
Execute Google image search and store the first result image
    Open Google search page
    Search for                  ${SEARCH_TERM}
    View image search results
    Screenshot first result
    [Teardown]                  Close Browser

*** Keywords ***
Open Google search page
    Open Chrome Browser     ${GOOGLE_URL}   headless=True

Search for
    [Arguments]     ${text}  
    Input Text      name:q      ${text}
    Press Keys      name:q      ENTER

View image search results
    Click Link  Images

Screenshot first result
    Capture Element Screenshot  css:div[data-ri="0"]
