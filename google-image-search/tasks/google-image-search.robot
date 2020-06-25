*** Settings ***
Documentation     Executes Google image search and stores the first result image.
Library           RPA.Browser

*** Variables ***
${GOOGLE_URL}     https://google.com/?hl=en
${SEARCH_TERM}    cute cat picture

*** Keyword ***
Open Google search page
    Open Available Browser    ${GOOGLE_URL}

*** Keyword ***
Search for
    [Arguments]    ${text}
    Input Text    name:q    ${text}
    Press Keys    name:q    ENTER
    Wait Until Page Contains    results

*** Keyword ***
View image search results
    Click Link    Images

*** Keyword ***
Screenshot first result
    Capture Element Screenshot    css:div[data-ri="0"]

*** Task ***
Execute Google image search and store the first result image
    Open Google search page
    Search for    ${SEARCH_TERM}
    View image search results
    Screenshot first result
    [Teardown]    Close Browser
