# ## Simple web scraper robot
# Opens a web page and stores some content.

*** Settings ***
Documentation     A simple web scraper robot.
...               Opens a website.
...               Stores the web page text in a file in the output directory.
...               Saves a screenshot of an element in the output directory.
Library           RPA.Browser
Library           RPA.FileSystem

*** Variables ***
${URL}=           https://robotframework.org/

*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}
    ${text}=    Get Text    scroller
    Create File
    ...    ${CURDIR}${/}output${/}text.txt
    ...    ${text}
    ...    overwrite=True
    Screenshot
    ...    css:.img-fluid
    ...    ${CURDIR}${/}output${/}screenshot.png
    [Teardown]    Close Browser
