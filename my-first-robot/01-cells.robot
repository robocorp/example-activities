# -*- coding: utf-8 -*-
#
# ## Part 1. Understanding Cells
#
# At the core of all living organisms are cells, and robots are exactly the same! Our software robots are built up of cells, just like every other organism.
#
# Here's what a cell looks like in our robot file:

*** I am a cell! ***

# Not very interesting, is it? And there seems to be an **error**... That's because there are only *four* recognised cell types in Robocorp Lab robots!
#
# Let's start with the first real cell type: `*** Settings ***`. Here's what one looks like:

*** Settings ***
Documentation     My first robot!
Library           RPA.Browser
Task Teardown     Close All Browsers

# That's better. We're not getting any errors now because this is a cell type our robot understands.
#
# The `*** Settings ***` cell is where we define *two* main concepts:
#
# 1. **CONFIGURATION to manage and describe our robot:**
#    - `Documentation`: our robot's name
#    - `Task Teardown`: what to do when it finishes its tasks 
#
#
# 2. **LIBRARIES to give our robot special functionality, in the form of keywords:**
#    - `RPA.Browser`: so our robot can control our web browser
#
#
# Before we move on we need to try giving our cell life! A dead cell is useless to a robot. To _run_ our cell, we simply click on the cell and then click the `▸` button in the toolbar full of icons.
#
# Try clicking on the `*** Settings ***` cell above and then clicking `▸` now.
#
# See how the `[number]:` at the top-left of the `*** Settings ***` cell changed? Now we know our cell is alive and ready to use!
#
# In the next part we'll define the tasks that we want our robot to perform using the `*** Tasks ***` cell type!
#
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 2: Tasks](./02-tasks.robot)
