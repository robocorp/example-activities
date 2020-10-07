# -*- coding: utf-8 -*-
#
# ## Our Robot So Far:
# ****

*** Settings ***
Documentation     My first robot!
Library           RPA.Browser
Task Teardown     Close All Browsers

*** Tasks ***
Find an Image from Google Images
    Find Image

# ****
#
# ## Part 3. Keywords
#
# So, now we've seen _two_ of the _four_ available cell types, `*** Settings ***` and `*** Tasks ***`.
# 
# - In the `*** Settings ***` we gave our robot access to powerful web browser-related keywords by importing the `RPA.Browser` library
# - In the `*** Tasks ***` cell we gave our robot a named task with the 'Find Image' keyword that will be activated when that task is run
#
# Now we need to describe what work is represented by the 'Find Image' keyword.
#
# But what is a *keyword*? Basically, keywords are comprised of bits of functionality that can be referenced and executed by name, like functions in other programming languages! Keywords can either come from imported libraries (like `RPA.Browser`) or defined by us in the `*** Keywords ***` cell.
#
# The `*** Keyword ***` cell is where we can create our own custom keywords. Let's setup our `*** Keyword ***` cell with the 'Find Image' keyword we defined in our `*** Tasks ***` cell, as part of the 'Find an Image from Google Images' *Task*.

*** Keyword ***
Find Image

# Now we can define the actual process that will occur when the 'Find Image' keyword is executed... but what do we want to happen when our robot tries to 'Find Image'?
#
# Software robots are meant to replicate processes that would otherwise be completed by a human: so, how would a human search for an image in Google?
#
# Let's describe it as clearly and simply as possible:
# 1. Open the browser
# 2. Enter a search term in the searchbar
# 3. Click 'Search'
# 4. Wait for Google to find the images
# 5. Choose an image they like
#
# We can describe this step-by-step process a human would take to our robot using special keywords provided when we imported the `RPA.Browser` library. Here's how it looks...

*** Keyword ***
Find Image
    Open Available Browser    https://images.google.com
    Input Text    name:q    cute puppy
    Submit Form
    Wait Until Element Is Visible  alias:Google.FirstImage
    Screenshot    alias:Google.FirstImage

# Our robot is now almost ready. In the next step we will put all of our robot's cells together and actually run it!
# 
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 4: Running Our Robot](./04-running-our-robot.robot)