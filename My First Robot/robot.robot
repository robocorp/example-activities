# -*- coding: utf-8 -*-
# <img src="images/robocode_lab.png" width="200" style="margin-top:20px">
#
# # My First Robot - Tutorial
#
# This tutorial guides you through some of the basic ideas
# and features related to software robot development with Lab.
#
# By default in Robocorp Lab you implement robots in notebook format.
# This document as any other notebook integrates code and its output.
#
# Two basic ways to run the code are:
# - run the whole notebook - `▸▸`
# - run just a single code cell - `▸`
#
# Additionally you can run the whole robot in isolation with the `▸ Run Robot` button in the app toolbar.
# It is similar how Robocorp Cloud and Robocorp App would run the robot.
# Use it when testing out the final solution.
#
# ### Step 1. Importing libraries and running a cell
#
# There are following cell types:
# * `*** Settings ***`
# * `*** Variables ***`
# * `*** Keywords ***`
# * `*** Tasks ***`
#
# Keyword libraries and other configuration can be done in `*** Settings ***` section.
#
# To apply changes, click on a cell and press `▸`. Keyboard shortcut: shift-enter. After that you have access to the keywords provided by the libraries.
#

*** Settings ***
Documentation   An example robot.
Library         RPA.Browser
Library         RPA.core.notebook
Task Teardown   Close All Browsers

# ### Step 2. Editing a cell
#
# In the next cell we declare a new keyword called "Say Hello", which prints a simple greeting.
#

*** Keyword ***
Say Hello
    Notebook Print  Hello!

# Now try to change the `Hello!` to something more appealing maybe.
#
# `NOTE` There need to be at least two (2) spaces between a keyword and an argument.
#
# To apply changes, click on a cell and press `▸`. Keyboard shortcut: shift-enter.

# ### Step 3. Running a single cell from a button
#
# Run the single keyword from the button below it, `Say Hello`.
#
# `NOTE` When modifying the cell always remember to apply changes with `▸`.
#
#
# ### Step 4. Modify and run another cell
#
# Run the next cell below (`▸` or shift-enter) and then press the `Find Image` button below it. You should see a nice picture.
#
# Now, change `cute little puppy` to your (another) favorite animal, run the cell `▸` and press the `Find Image` button. Sounds familiar, right?

*** Keyword ***
Find Image
    Open Available Browser  https://images.google.com
    Input Text   name:q  cute little puppy
    Submit Form
    Capture Element Screenshot    css:div[data-ri="0"]  # Here we use locator to find the first image

# ### Step 5. Running the whole notebook
#
# Finally, the `*** Tasks ***` section is an entrypoint to our robot. When the whole robot is run in Robocorp Cloud or Robocorp App, that's the only cell it'll be looking for.
#
# Add the keyword `Find Image` below `Say Hello` (remember the intendation) and run the whole notebook with `▸▸` or ctrl-shift-enter (cmd-shift-enter on macOS). Click `Restart` and the notebook runs.
#
# You should see the image printed out.

*** Tasks ***
This is my task
    Say Hello
    # This is a placeholder for Find Image

# ### Step 6. Upload robot to Robocorp Cloud
#
# Finally, let's upload our robot to Robocorp Cloud so that it can be run on a schedule either in cloud or maybe in another machine.
#
# At first, make sure you have an account in Robocorp Cloud and have linked Lab to it from Welcome Screen. You also need an existing Robot in cloud so that we can update the contents of it from the Lab. Create either a new robot or use existing example project but please note the content will be overwritten.
#
# Push `Publish to Robocorp Cloud` in the tool bar, select a workspace and an existing robot and hit `Publish`.
#
# You now have the robot available for use in Robocorp Cloud!
