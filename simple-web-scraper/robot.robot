# ## Simple web scraper example
# Opens a web page and stores some content.

*** Settings ***
Documentation     An example robot. Opens a web page and stores some content.
...               The web page text is stored in the "output" directory.
...               An image screenshot is embedded in the log.
Library           OperatingSystem
Library           RPA.Browser

*** Variables ***
${URL}            https://robotframework.org/

*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}
    ${text}=    Get Text    scroller
    Create File    ${OUTPUT DIR}${/}text.txt    ${text}
    Capture Element Screenshot    css:.img-fluid
    [Teardown]    Close Browser
