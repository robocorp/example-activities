# -*- coding: utf-8 -*-
# <img src="images/robocode_lab.png" width="200" style="margin-top:20px">
#
# # My First Robot - Tutorial
#
# This tutorial guides you through some of the basic ideas
# and features related to software robot development with Lab.
#
# In Lab you implement robots using the notebook format, which integrates the code and its output.
#
# The two basic ways to run the code are:
# - run the whole notebook - `▸▸`
# - run just a single code cell - `▸`
#
# Additionally you can run the whole robot in isolation with the `▸ Run Robot` button in the app toolbar: this will simulate how Robocorp Cloud and Robocorp App would run the robot.
# Use it when testing out the finished robot.
#
# ### Step 1. Importing libraries and running a cell
#
# These are the possible cell types:
# * `*** Settings ***`
# * `*** Variables ***`
# * `*** Keywords ***`
# * `*** Tasks ***`
#
# To run a cell, click on it and press `▸` to evaluate it (keyboard shortcut: shift-enter). If you make changes to a cell, you need to evaluate it again.
#
# Importing keyword libraries and other configuration can be done in the `*** Settings ***` section. The keywords become available once you evaluate the `*** Settings ***` cell. 
#
# **Click the `*** Settings ***` cell below and evaluate it now:**

*** Settings ***
Documentation     An example robot.
Library           RPA.Browser
Library           RPA.core.notebook
Task Teardown     Close All Browsers

# ### Step 2. Editing a cell
#
# In the next cell we declare a new keyword called "Say Hello", which prints a simple greeting.
#

*** Keyword ***
Show Greeting
    Notebook Print    Hello!

# Now try to change the `Hello!` to something else.
#
# `NOTE` There need to be at least two (2) spaces between a keyword and its arguments.
#
# To apply your changes, click on the cell and press `▸`. You will see a `Show Greeting` button.
#

# ### Step 3. Running a single cell from a button
#
# Run the single keyword from the button below it, `Show Greeting`.
#
# `NOTE` When modifying the cell always remember to apply changes with `▸`.
#
# ### Step 4. Modify and run another cell
#
# Run the next cell below (`▸` or shift-enter) and then press the `Find Image` button below it. You should see a nice picture!
#
# Now, change `cute little puppy` to your (another) favorite animal, run the cell `▸` and press the `Find Image` button. Now you should see a different picture!

*** Keyword ***
Find Image
    Open Available Browser    https://images.google.com
    Input Text    name:q    cute little puppy
    Submit Form
    Capture Element Screenshot    css:div[data-ri="0"]  # Here we use locator to find the first image

# ### Step 5. Running the whole notebook
#
# Finally, the `*** Tasks ***` section is the entrypoint to our robot, that will be run when our robot is executed in Robocorp Cloud or Robocorp App.
#
# A task executes keywords in sequence. Add the keyword `Find Image` below the `Say Hello` keyword (remember the indentation!) and run the whole notebook with `▸▸` or ctrl-shift-enter (cmd-shift-enter on macOS). Click `Restart` : the whole notebook will run and you should see your image printed out.

*** Tasks ***
This is my task
    Show Greeting
    # Uncomment the next line to add the Find Image keyword:
    # Find Image


# ### Step 6. Upload the robot to Robocorp Cloud
#
# Finally, let's upload our robot to Robocorp Cloud so that it can be run on a schedule either in cloud or maybe in another machine.
#
# Make sure you have an account in Robocorp Cloud and you have linked Robocorp Lab to it using the button on the Welcome Screen. 
#
# An example workspace, process and robot have been created automatically with your account.
#
# Push the `Publish to Robocorp Cloud` button in the tool bar, select your example workspace, the `Google Image Search` robot inside it and hit `Publish`.
#
# You now have the robot available for use in Robocorp Cloud, go there and run it!
