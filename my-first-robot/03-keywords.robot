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
# We've given our robot the utilities it needs to run in `*** Settings ***`, we've told it what we want it to do in the `*** Tasks ***` cell, but we haven't described what steps it needs to take to complete that *Task*! 
#
# The `*** Keyword ***` cell is where we break our *Task*'s steps down into actual instructions. Let's setup our `*** Keyword ***` cell with the *Task* step's name we defined in our `*** Tasks ***` cell.

*** Keyword ***
Find Image

# Software robots are meant to replicate tasks that would otherwise be completed by a human: so, how would a human search for an image in Google?
#
# Let's describe it as clearly and simply as possible:
# 1. Open the browser
# 2. Enter a search term in the searchbar
# 3. Click 'Search'
# 4. Wait for Google to find the images
# 5. Choose an image they like
#
# We can describe this step-by-step process a human would take to our robot using special commands that we made available when we added the *RPA.Browser* utility in our Robot's `***Settings***`. Here's how it looks...

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