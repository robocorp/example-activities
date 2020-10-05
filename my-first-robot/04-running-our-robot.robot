# -*- coding: utf-8 -*-
#
# ## Our Robot So Far:
# ****

*** Settings ***
Documentation     My first robot!
Library           RPA.Browser
Task Teardown     Close All Browsers

*** Keyword ***
Find Image
    Open Available Browser    https://images.google.com
    Input Text    name:q    cute puppy
    Submit Form
    Wait Until Element Is Visible  alias:Google.FirstImage
    Screenshot    alias:Google.FirstImage

*** Tasks ***
Find an Image from Google Images
    Find Image

# ****
#
# ## Part 4. Running Our Robot
#
# With all of these cells together in one file, we have created a complete software robot! Let's bring each of its cells to life and watch it run.
#
# We have several options for running robots in Robocorp Lab:
#
# 1. **Click on each cell, and then the `▸`, one after the other:**  
#     - The `▸` button is found in the icon toolbar
#
#
# 2. **Running all the cells in an open `.robot` file in one go by clicking `▸▸`:**
#     - The `▸▸` button is found in the icon toolbar
#     - This is known as '*running the notebook*' and will ask whether you want to '*Restart Kernel?*' That's okay! You can click `Restart`
#
#
# 3. **Running the main robot configured for a project by clicking `▸ Run Robot`:**
#      - The `▸ Run Robot` button is found at the top-right of the Lab
#      - The main robot for a project is configured in the `robot.yaml` file (We'll discuss this file in depth in a more advanced tutorial)
#
# Try any one of these methods now...
#
# After a short wait, you'll see a 'Find Image' button appear as the robot has gathered all the resources it needs to operate after running the cells. Click the button! 
#
# Now we have a fully working robot running on our computer at our command!
#
# However, our robot isn't doing much good only being run on our computer only when we tell it to. That's why we move robots we create in the Robocorp Lab to the Robocorp Cloud; every robot we make should aim to live there.
# This is because robots that live in the Robocorp Cloud become truly powerful: we can instruct our robots there, armies of them, to run automatically wherever and whenever you want to, and not just on your own computer!
#
# The last part of the tutorial will show you how to achieve this.
#  
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 5: Moving Our Robot to the Cloud](./05-moving-our-robot-to-the-cloud.robot)
