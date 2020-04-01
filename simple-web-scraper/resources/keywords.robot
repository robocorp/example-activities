*** Settings ***
Library     ExampleLibrary
Library     OperatingSystem
Library     RPA.Browser
Variables   variables.py

*** Keyword ***
Store web page content
    ${current_date}=            Current date
    Log                         ${current_date}
    Set Selenium Speed          0.2 second
    Open Available Browser      ${URL}
    Click Link                  Examples
    Click Link                  Libraries
    ${text}=                    Get Text            scroller
    Create File                 output/text.txt     ${text}
    Capture Element Screenshot  css:.img-fluid
    [Teardown]                  Close Browser
