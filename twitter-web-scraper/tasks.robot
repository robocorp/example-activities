# ## Twitter web scraper example
# Opens the Twitter web page and stores some content.

*** Settings ***
Documentation     Opens the Twitter web page and stores some content.
Library           RPA.Browser
Library           RPA.FileSystem

*** Variables ***
${USER_NAME}=     RobocorpInc
${NUMBER_OF_TWEETS}=    3
${TWEET_DIRECTORY}=    ${CURDIR}${/}output${/}tweets/${USER_NAME}
${TWEETS_LOCATOR}=    xpath://article[descendant::span[contains(text(), "\@${USER_NAME}")]]

*** Keywords ***
Open Twitter homepage
    Open Available Browser    https://twitter.com/${USER_NAME}

*** Keywords ***
Accept the cookie notice
    Run Keyword And Ignore Error
    ...    Click Element When Visible
    ...    xpath://span[contains(text(), "Close")]

*** Keywords ***
Hide distracting UI elements
    # Use JavaScript to hide distracting elements (the header and the footer).
    Execute Javascript    document.querySelector('div[data-testid="primaryColumn"] > div > div').style.display = 'none'
    Execute Javascript    document.querySelector('#layers > div').style.display = 'none'

*** Keywords ***
Scroll down to load dynamic content
    Execute Javascript    window.scrollBy(0, 2000)

*** Keywords ***
Get tweets
    Wait Until Element Is Visible    ${TWEETS_LOCATOR}
    Scroll Element Into View    ${TWEETS_LOCATOR}
    Sleep    2s    # Give dynamic content some time to load.
    @{tweets}=    Get WebElements    ${TWEETS_LOCATOR}
    [Return]    @{tweets}

*** Keywords ***
Store the tweets
    Create Directory    ${TWEET_DIRECTORY}    parents=True
    ${index}=    Set Variable    1
    @{tweets}=    Get tweets
    FOR    ${tweet}    IN    @{tweets}
        Exit For Loop If    ${index} > ${NUMBER_OF_TWEETS}
        ${screenshot_file}=    Set Variable    ${TWEET_DIRECTORY}/tweet-${index}.png
        ${text_file}=    Set Variable    ${TWEET_DIRECTORY}/tweet-${index}.txt
        ${text}=    Set Variable    ${tweet.find_element_by_xpath(".//div[@lang='en']").text}
        Screenshot    ${tweet}    ${screenshot_file}
        Create File    ${text_file}    ${text}    overwrite=True
        ${index}=    Evaluate    ${index} + 1
    END

*** Tasks ***
Store the latest tweets by given user name
    Open Twitter homepage
    Accept the cookie notice
    Hide distracting UI elements
    Scroll down to load dynamic content
    Store the tweets
    [Teardown]    Close Browser
