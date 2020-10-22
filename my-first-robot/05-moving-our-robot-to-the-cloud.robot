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
    # This newly added 'filename' value tells the robot where we want the chosen image to be saved
    Screenshot    alias:Google.FirstImage  filename=%{ROBOT_ROOT}${/}output${/}image_from_google.png

*** Tasks ***
Find an Image from Google Images
    Find Image

# ****
#
# ## Part 5. Moving Our Robot to the Cloud
#
# > **NOTE**: Make sure you have first [linked your Robocorp Lab installation to Robocorp Cloud](https://robocorp.com/docs/product-manuals/robocorp-lab/linking-robocorp-lab-to-robocorp-cloud).
# >
# > To check, please close the tutorial, navigate to Robocorp Lab's 'Welcome' screen, and look for the `Link to Cloud` button; if it exists, then click it, link to the Robocorp Cloud and then repon this tutorial.*
#
# So, you've linked your Robocorp Lab to Robocorp Cloud but before uploading our robot, and now we're ready to publish our robot to the Cloud from here in Robocorp Lab! Here's how we do it...
#
# 1) Look to the top right of the Lab window, in the tool bar, and click the `Publish to Robocorp Cloud` button.
#
# 2) In the dialog that opens: select 'Example workspace' => select the 'Google Image Search' robot inside it => click `Publish`!
#
# > **NOTE:** It will ask if you want to overwrite the example robot in the Cloud with our new Lab's robot: we do, so click `Confirm`
#
# It's easy as that, our robot from this file is now available in the Robocorp Cloud! Please note that any changes that we make to our robot in Robocorp Lab will have to be republished so the robot in the Cloud is updated as well.
#
# Now go back to the Robocorp Cloud in your web browser and try to run our robot from there.
#
# When you've done that, let's finish by looking at what we've learned and some ideas for further development.
#
# <img src="../images/robot.svg" width="16" style="vertical-align:text-top">&nbsp; [Part 6: Finishing Thoughts](./06-finishing-thoughts.md)
