# -*- coding: utf-8 -*-
# <img src="images/logo.svg" width="200" style="margin-top:20px">
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
# In the next cell we declare a new keyword called "Show Greeting", which prints a simple greeting.
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
# Run the single keyword above from the button below it, `Show Greeting`.
#
# `NOTE` When modifying the cell always remember to apply changes with `▸`.
#
# ### Step 4. Modify and run another cell
#
# Run the next cell below (`▸` or shift-enter) and then press the `Find Image` button below it. You should see a nice picture!
#
# Now, change `cute puppy` to your (another) favorite animal, run the cell `▸` and press the `Find Image` button. Now you should see a different picture!

*** Keyword ***
Find Image
    Open Available Browser    https://images.google.com
    Input Text    name:q    cute puppy
    Submit Form
    # Here we use a UI Locator to find the first image, and save it to a file in the output folder.
    Screenshot    alias:Google.FirstImage  filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

# ### Step 5. Running the whole notebook
#
# Finally, the `*** Tasks ***` section is the starting point of our robot when it runs in Robocorp Cloud or Robocorp App.
#
# A task executes keywords in sequence. Add the keyword `Find Image` below the `Show Greeting` keyword (remember the indentation!) and run the whole notebook with `▸▸` or ctrl-shift-enter (cmd-shift-enter on macOS). Click `Restart` : the whole notebook will run and you should see your image printed out.

*** Tasks ***
This is my task
    Show Greeting
    # Uncomment the next line to add the Find Image keyword:
    # Find Image


# ### Step 6. Save your work and upload the robot to Robocorp Cloud
#
# Finally, let's upload our robot to Robocorp Cloud so that it can be run on a schedule either in cloud or maybe in another machine.
#
# First, **save your changes to the file**: select`File`->`Save All` from the menu toolbar, or press **control+s** (**command+s** on macOS).
#
# To have everything prepared in Robocorp Cloud, make sure you can access it via your browser. Run the following cell (`▸` or shift-enter)
# and press the `Visit Robocorp Cloud` button below it.

*** Keyword ***
Visit Robocorp Cloud
    Open User Browser    https://cloud.robocorp.com

# An example workspace, process and robot have been created automatically with your Robocorp Cloud account.
#
# Push the `Publish to Robocorp Cloud` button in the tool bar, select your example workspace, the `Google Image Search` robot inside it and hit `Publish`.
#
# > Note: *If the upload button is disabled, close this window and first [Link your Robocorp Lab installation to Robocorp Cloud](https://robocorp.com/docs/product-manuals/robocorp-lab/linking-robocorp-lab-to-robocorp-cloud) in the welcome screen. Then reopen this tutorial.*
#
# You have now overwritten the example robot in the cloud with your updated version, go there and run it!
