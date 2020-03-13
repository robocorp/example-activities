*** Settings ***
Library     ExampleLibrary
Library     OperatingSystem
Library     SeleniumLibrary
Variables   variables.py

*** Keywords ***
Store web page content
    ${current_date}=            Current date
    Log                         ${current_date}
    Set Selenium Speed          0.2 second
    Open Browser                ${URL}              ${BROWSER}
    Click Link                  Examples
    Click Link                  Libraries
    ${text}=                    Get Text            scroller
    Create File                 output/text.txt     ${text}
    Capture Element Screenshot  css:.img-fluid
    [Teardown]                  Close Browser
