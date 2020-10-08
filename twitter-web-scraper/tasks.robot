# ## Twitter web scraper example
# Opens the Twitter web page and stores some content.

*** Settings ***
Documentation     Opens the Twitter web page and stores some content.
Library           Collections
Library           RPA.Browser
Library           RPA.FileSystem
Library           RPA.RobotLogListener

*** Variables ***
${USER_NAME}=     RobocorpInc
${NUMBER_OF_TWEETS}=    3
${TWEET_DIRECTORY}=    ${CURDIR}${/}output${/}tweets/${USER_NAME}
${TWEETS_LOCATOR}=    xpath://article[descendant::span[contains(text(), "\@${USER_NAME}")]]

*** Keywords ***
Open Twitter homepage
    Open Available Browser    https://mobile.twitter.com/${USER_NAME}

*** Keywords ***
Accept the cookie notice
    Run Keyword And Ignore Error
    ...    Click Element When Visible
    ...    xpath://span[contains(text(), "Close")]

*** Keywords ***
Hide element
    [Arguments]    ${locator}
    Mute Run On Failure    Execute Javascript
    Run Keyword And Ignore Error
    ...    Execute Javascript
    ...    document.querySelector('${locator}').style.display = 'none'

*** Keywords ***
Hide distracting UI elements
    @{locators}=    Create List
    ...    header
    ...    \#layers > div
    ...    nav
    ...    div[data-testid="primaryColumn"] > div > div
    ...    div[data-testid="sidebarColumn"]
    FOR    ${locator}    IN    @{locators}
        Hide element    ${locator}
    END

*** Keywords ***
Scroll down to load dynamic content
    FOR    ${pixels}    IN RANGE    200    2000    200
        Execute Javascript    window.scrollBy(0, ${pixels})
        Sleep    500ms
    END
    Execute Javascript    window.scrollTo(0, 0)
    Sleep    500ms

*** Keywords ***
Get tweets
    Wait Until Element Is Visible    ${TWEETS_LOCATOR}
    @{all_tweets}=    Get WebElements    ${TWEETS_LOCATOR}
    @{tweets}=    Get Slice From List    ${all_tweets}    0    ${NUMBER_OF_TWEETS}
    [Return]    @{tweets}

*** Keywords ***
Store the tweets
    Create Directory    ${TWEET_DIRECTORY}    parents=True
    ${index} =    Set Variable    1
    @{tweets}=    Get tweets
    FOR    ${tweet}    IN    @{tweets}
        ${screenshot_file}=    Set Variable    ${TWEET_DIRECTORY}/tweet-${index}.png
        ${text_file}=    Set Variable    ${TWEET_DIRECTORY}/tweet-${index}.txt
        ${text}=    Set Variable    ${tweet.find_element_by_xpath(".//div[@lang='en']").text}
        Screenshot    ${tweet}    ${screenshot_file}
        Create File    ${text_file}    ${text}    overwrite=True
        ${index} =    Evaluate    ${index} + 1
    END

*** Tasks ***
Store the latest tweets by given user name
    Open Twitter homepage
    Accept the cookie notice
    Hide distracting UI elements
    Scroll down to load dynamic content
    Store the tweets
    [Teardown]    Close Browser
