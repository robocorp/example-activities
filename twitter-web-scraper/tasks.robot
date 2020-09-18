# ## Twitter web scraper example
# Opens the Twitter web page and stores some content.

*** Settings ***
Documentation     Opens the Twitter web page and stores some content.
Library           RPA.Browser
Library           RPA.FileSystem

*** Variables ***
${NUMBER_OF_TWEETS}=    3
${TWITTER_URL}=    https://twitter.com
${USER_NAME}=     RobocorpInc

*** Keywords ***
Store the latest ${number_of_tweets} tweets by user name "${user_name}"
    Open Twitter homepage    ${user_name}
    Run Keyword And Ignore Error    Accept cookie notice
    Store tweets    ${user_name}    ${number_of_tweets}
    [Teardown]    Close Browser

*** Keywords ***
Open Twitter homepage
    [Arguments]    ${user_name}
    Open Available Browser    ${TWITTER_URL}/${user_name}

*** Keywords ***
Accept cookie notice
    ${cookie_acceptance_link}=    Get cookie acceptance link locator
    Click Element When Visible    ${cookie_acceptance_link}

*** Keywords ***
Store tweets
    [Arguments]    ${user_name}    ${number_of_tweets}
    ${tweets_locator}=    Get tweets locator    ${user_name}
    Wait Until Element Is Visible    ${tweets_locator}
    @{tweets}=    Get WebElements    ${tweets_locator}
    ${tweet_directory}=    Get tweet directory    ${user_name}
    Create Directory    ${tweet_directory}    parents=True
    ${index}=    Set Variable    1
    FOR    ${tweet}    IN    @{tweets}
        Exit For Loop If    ${index} > ${number_of_tweets}
        ${screenshot_file}=    Set Variable    ${tweet_directory}/tweet-${index}.png
        ${text_file}=    Set Variable    ${tweet_directory}/tweet-${index}.txt
        ${text}=    Set Variable    ${tweet.find_element_by_xpath(".//div[@lang='en']").text}
        Capture Element Screenshot    ${tweet}    ${screenshot_file}
        Create File    ${text_file}    ${text}
        ${index}=    Evaluate    ${index} + 1
    END

*** Keywords ***
Get tweets locator
    [Arguments]    ${user_name}
    [Return]    xpath://article[descendant::span[contains(text(), "\@${user_name}")]]

*** Keywords ***
Get cookie acceptance link locator
    [Return]    xpath://span[contains(text(), "Close")]

*** Keywords ***
Get tweet directory
    [Arguments]    ${user_name}
    [Return]    ${CURDIR}${/}output${/}tweets/${user_name}

*** Tasks ***
Store the latest tweets by given user name
    Store the latest ${NUMBER_OF_TWEETS} tweets by user name "${USER_NAME}"
