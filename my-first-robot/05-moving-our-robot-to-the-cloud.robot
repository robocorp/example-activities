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
    Wait Until Element Is Visible  alias:Google.FirstImage
    # This newly added 'filename' value tells the robot where we want the chosen image to be saved
    Screenshot    alias:Google.FirstImage  filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

# ****
#
# ## Part 5. Moving Our Robot to the Cloud
# 
# > Note: *Make sure you have first [linked your Robocorp Lab installation to Robocorp Cloud](https://robocorp.com/docs/product-manuals/robocorp-lab/linking-robocorp-lab-to-robocorp-cloud). If not, you can do so from the Robocorp Lab's Welcome screen and then reopen this tutorial.*
# 
# Before uploading our robot, we have to make sure everything is set-up in the Cloud for it to be welcomed into its new home. Robocorp has written its own robot to make this as easy as clicking a button, such is the power of software robots!
#
# Click the cell below, click `▸`, and then click the 'Visit Robocorp Cloud' button that appears below it.

*** Keyword ***
Visit Robocorp Cloud
    Open User Browser    https://cloud.robocorp.com

# All seems ready, let's publish our robot! Look to the top right of the Lab window, in the tool bar, and click the `Publish to Robocorp Cloud` button. Select the example workspace, the Google Image Search robot inside it and hit Publish! 
# 
# Now the robot from this file is available in the cloud! Please note that any changes that we make to our robot will have to be republished.
# 
# Now go back to the Robocorp Cloud in your web browser and try to run our robot from there.
#
# When you've done that, let's finish by looking at what we've learned and some ideas for further development.
# 
# <img src="../images/robot.svg" width="16"  style="vertical-align:text-top">&nbsp; [Part 6: Finishing Thoughts](./06-finishing-thoughts.md).