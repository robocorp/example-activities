# ## Dialogs Google Image Search
#
# This robot demonstrates the use of the [`RPA.Dialogs`](https://robocorp.com/docs/libraries/rpa-framework/rpa-dialogs) library to create a simple user interface to allow the user to choose a search query for an image in Google Images Search.
#
#
# > You can find more information on this example robot on our [documentation site](https://robocorp.com/docs/development-howtos/dialogs-assistant/how-to-collect-input-from-users).

*** Settings ***
Documentation     Example robot that allows a human to search for a specific
...               search query in Google Images
Library           RPA.Dialogs
Library           RPA.Browser
Suite Teardown    Close All Browsers

*** Keywords ***
Collect Search Query From User
    Create Form    Search form
    Add Text Input    Search query    search
    &{response}=    Request Response
    [Return]    ${response["search"]}

*** Keywords ***
Search Google Images For Requested Query
    [Arguments]    ${search_query}
    Open Available Browser    https://images.google.com
    Input Text    name:q    ${search_query}
    Submit Form

*** Keywords ***
Collect The First Search Result Image
    Wait Until Element Is Visible    css:div[data-ri="0"]
    Screenshot    css:div[data-ri="0"]
    ...    filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

*** Tasks ***
Save The First Image For a Search Query Collected From The User
    ${search_query}=    Collect search query from user
    Search Google Images For Requested Query    ${search_query}
    Collect The First Search Result Image
