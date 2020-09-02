*** Settings ***
Documentation     Executes Google image search and stores the first result image.
Library           RPA.Browser

*** Variables ***
${GOOGLE_URL}     https://google.com/?hl=en
${SEARCH_TERM}    cute cat picture

*** Keywords ***
Open Google search page
    Open Available Browser    ${GOOGLE_URL}

*** Keywords ***
Search for
    [Arguments]    ${text}
    Input Text    name:q    ${text}
    Press Keys    name:q    ENTER
    Wait Until Page Contains    results

*** Keywords ***
View image search results
    Click Link    Images

*** Keywords ***
Screenshot first result
    Capture Element Screenshot    css:div[data-ri="0"]    ${OUTPUT DIR}${/}screenshot.png

*** Tasks ***
Execute Google image search and store the first result image
    Open Google search page
    Search for    ${SEARCH_TERM}
    View image search results
    Screenshot first result
    [Teardown]    Close Browser
