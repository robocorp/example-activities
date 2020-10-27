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
    ${FIRST_IMAGE}=  Set Variable    css:div[data-ri=\"0\"]
    Wait Until Element Is Visible    ${FIRST_IMAGE}
    # This newly added 'filename' value tells the robot where we want the chosen image to be saved
    Screenshot    ${FIRST_IMAGE}    filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

*** Tasks ***
Find an Image from Google Images
    Find Image

# ****
#
# ## Part 5. Moving Our Robot to the Cloud
#
# > **NOTE**: *Make sure you have first [linked your Robocorp Lab installation to Robocorp Cloud](https://robocorp.com/docs/product-manuals/robocorp-lab/linking-robocorp-lab-to-robocorp-cloud).
# >
# > To check, please close the tutorial, navigate to Robocorp Lab's 'Welcome' screen, and look for the `Link to Cloud` button; if it exists, then click it, link to the Robocorp Cloud and then repon this tutorial.*
#
# So, you've linked your Robocorp Lab to Robocorp Cloud but before uploading our robot, we have to make sure everything is set-up in the Cloud for it to be welcomed into its new home.
# Robocorp has provided a cell for you to make this as easy as clicking a button, such is the power of software robots!
#
# Let's setup Robocorp's cell with our `*** Settings ***` cell. Run our robot's `*** Settings ***` cell above first with the 'click-then-`▸`' process we've learned, then run the `*** Keyword ***` cell below in the same way.

*** Keyword ***
Visit Robocorp Cloud
    Open User Browser    https://cloud.robocorp.com

# A `Visit Robocorp Cloud` button should have appeared. Click it!
#
# All seems ready, let's publish our robot from here in Robocorp Lab! Look to the top right of the Lab window, in the tool bar, and click the `Publish to Robocorp Cloud` button.
#
# Now, select 'Example workspace', then select the 'Google Image Search' robot inside it and click `Publish`! It will ask if you want to overwrite the example robot in the Cloud with our new Lab's robot: we do, so select `Confirm`
#
# Our robot from this file is now available in the Robocorp Cloud! Please note that any changes that we make to our robot in Robocorp Lab will have to be republished so the robot in the Cloud is updated as well.
#
# Now go back to the Robocorp Cloud in your web browser and try to run our robot from there.
#
# When you've done that, let's finish by looking at what we've learned and some ideas for further development.
#
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 6: Finishing Thoughts](./06-finishing-thoughts.md)
