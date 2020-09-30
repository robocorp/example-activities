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

*** Keyword ***
Find Image
    Open Available Browser    https://images.google.com
    Input Text    name:q    cute puppy
    Submit Form
    Screenshot    alias:Google.FirstImage

# ****
#
# ## Part 4. Running Our Robot
#
# With all of these cells together in one file, we have created a complete software robot! Let's bring each of its cells to life and watch it run.
# 
# We can do this by either:
# * Clicking each cell and then the `▸` one after the other
# * Running all the robot's cells in one go by clicking `▸▸` (this is known as 'running the notebook')
#
# Try either of these methods now...
# 
# Now we have a fully working robot running on our computer at our command!
#
# However, our robot isn't doing much good only being run on our computer only when we tell it to. That's we move robots we create in the Robocorp Lab to the Robocorp Cloud.
# In the Robocorp Cloud we can instruct our robots to run automatically wherever and whenever you want to, and not just on your own computer!
#
# The last part of the tutorial will show you how to achieve this.
#  
# <img src="../images/robot.svg" width="16"  style="vertical-align:text-top">&nbsp; [Part 5: Moving Our Robot to the Cloud](./05-moving-our-robot-to-the-cloud.robot)