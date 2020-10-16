# ## Http API robot
#
# This simple robot fetches and logs the latest launch data from SpaceX API using RPA Framework.
# > You can find the full tutorial and instructions on [Robocorp's documentation site](https://robocorp.com/docs/development-howtos/http/http-api-robot-tutorial).

*** Settings ***
Documentation     HTTP API robot. Retrieves data from SpaceX API. Demonstrates
...               how to use RPA.HTTP (create session, get response, validate
...               response status, pretty-print, get response as text, get
...               response as JSON, access JSON properties, etc.).
Library           RPA.HTTP
Library           RPA.core.notebook
Suite Setup       Setup
Suite Teardown    Teardown

*** Variables ***
${SPACEX_API_BASE_URL}=    https://api.spacexdata.com/v3
${SPACEX_API_LATEST_LAUNCHES}=    /launches/latest

*** Keywords ***
Setup
    Create Session    spacex    ${SPACEX_API_BASE_URL}    verify=True

*** Keywords ***
Teardown
    Delete All Sessions

*** Keywords ***
Log latest launch
    ${launch}=    Get latest launch
    Log info    ${launch}

*** Keywords ***
Get latest launch
    ${response}=    Get Request    spacex    ${SPACEX_API_LATEST_LAUNCHES}
    Request Should Be Successful    ${response}
    Status Should Be    200    ${response}
    [Return]    ${response}

*** Keywords ***
Log info
    [Arguments]    ${response}
    ${pretty_json}=    To Json    ${response.text}    pretty_print=True
    ${launch}=    Set Variable    ${response.json()}
    Notebook Print    ${pretty_json}
    Log    ${pretty_json}
    Notebook Print    ${launch["mission_name"]}
    Log    ${launch["mission_name"]}
    Notebook Print    ${launch["rocket"]["rocket_name"]}
    Log    ${launch["rocket"]["rocket_name"]}

*** Tasks ***
Log latest launch info
    Log latest launch
