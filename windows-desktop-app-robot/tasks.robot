# ## Windows Desktop App Robot
#
# This software robot opens the Spotify desktop application, searches for the given song, and plays the song. The robot demonstrates the basic Windows-automation capabilities of the RPA Framework, using keyboard navigation.
# > You can find the full tutorial and instructions on [Robocorp's documentation site](https://robocorp.com/docs/development-howtos/windows/windows-desktop-application-robot).


*** Settings ***
Documentation     Spotify Windows desktop application robot. Opens the Spotify
...               desktop application, searches for the given song, and plays the
...               song. Demonstrates the basic Windows-automation capabilities of
...               the RPA Framework, using keyboard navigation.
Library           RPA.Desktop.Windows

*** Variables ***
${EXECUTABLE_NAME}=    Spotify
${WINDOW_TITLE}=    Spotify Premium
${SONG_NAME}=     Monody

*** Keywords ***
Open the Spotify desktop application
    Open From Search    ${EXECUTABLE_NAME}    ${WINDOW_TITLE}

*** Keywords ***
Search for the song
    Send Keys To Input    ^l
    Send Keys To Input    ${SONG_NAME}

*** Keywords ***
Select the song
    Send Keys To Input    {TAB}{TAB}{TAB}

*** Keywords ***
Play the song
    Send Keys To Input    {ENTER}    with_enter=False
    Sleep    10

*** Tasks ***
Open Spotify desktop application and play a song
    Open the Spotify desktop application
    Search for the song
    Select the song
    Play the song
    [Teardown]    Close All Applications
