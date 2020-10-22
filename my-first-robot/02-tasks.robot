# -*- coding: utf-8 -*-
#
# ## Our Robot So Far:
# ****

*** Settings ***
Documentation     My first robot!
Library           RPA.Browser
Task Teardown     Close All Browsers

# ****
#
# ## Part 2. Tasks
#
# > **NOTE:** We're now in a new *.robot* file and you may have noticed that `*** Settings ***` no longer has a `[number]:` at the top-left of the cell.
# > This is because the state of a cell, whether it is 'alive' (technically, whether it has been compiled before), is **not** shared between different *.robot* files.
#
# After assigning our robot `*** Settings ***` we can add a `*** Tasks ***` cell that defines what we want our robot to do.
#
# Let's give our robot a short descriptive *Task* name. We wanted our robot to open the browser and find an image, so let's go with that. Here's our task cell, with its *Task* name.

*** Tasks ***
Find an Image from Google Images

# But this is only the *Task*'s name! The robot doesn't know what to do from that sentence alone. We can define the processes needed to complete the *Task* underneath the *Task* in the `*** Tasks ***` cell.

*** Tasks ***
Find an Image from Google Images
    Find Image

# Nice and straightforward! Let's try bringing this `*** Tasks ***` cell with its 'Find an Image from Google Images' *Task* name and the 'Find Image' task keyword to life.
#
# Click on the `*** Tasks ***` cell above and then the `▸` button. Try that now.
#
# Hm, that doesn't seem quite right... We got a `| FAIL |` with a `No keyword with name 'Find Image' found` error. Perhaps it's clear what we want our robot to do as its operator but our robot isn't intelligent enough to understand what we mean when we ask it to 'Find Image'?
#
# We'll have to define what exactly we want 'Find Image' to mean using our next cell type: `*** Keyword ***`
#
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 3: Keywords](./03-keywords.robot)