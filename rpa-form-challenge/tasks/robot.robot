# ## RPA Form Challenge example
#
# Run this example to solve the form challenge at http://rpachallenge.com/.
#
# Get the full tutorial and explanation <a href="https://hub.robocorp.com/knowledge-base/tutorials/rpa-form-challenge-tutorial/">on our site</a>.
#
# In Robocorp Lab, click on the `>>` button above to run the whole example, or you can execute each cell by using the `>` button.
#

# ### Settings section
#
# In this section  we add a description of our robot and reference the libraries that we want to use:
#
# Our robot uses these three libraries:
#
# - `RPA.Browser`: to interact with the browser
# - `RPA.Excel.Files`: to read the contents of our Excel file
# - `RPA.HTTP`: to download the Excel file from the challenge website.

*** Settings ***
Documentation     Robot to solve the first challenge at rpachallenge.com, which consists of
...               filling a form that randomly rearranges itself for ten times, with data
...               taken from a provided Microsoft Excel file.
Library           RPA.Browser
Library           RPA.Excel.Files
Library           RPA.HTTP

# ### Keyword: `Get The List Of People From the Excel File`
#
# In this keyword we are using the `RPA.Excel.Files` library to manipulate the Excel file (Keywords: `Open Workbook`, `Read Worksheet As Table`, `Close Workbook`), returning the data as a Table, so that we can iterate over it.

*** Keywords ***
Get The List Of People From The Excel File
    Open Workbook    challenge.xlsx
    ${table}=    Read Worksheet As Table    header=True
    Close Workbook
    [Return]    ${table}

# ### Keyword: `Set Value By Xpath`
# Here we are getting a little fancy :) to improve the speed of our robot, this keyword uses XPATH to set a form element value with minimum latency. (get the full details on why we are doing this <a href="https://hub.robocorp.com/knowledge-base/tutorials/rpa-form-challenge-tutorial/#right-now-lets-make-it-fast-"> here! </a> 

*** Keywords ***
Set Value By Xpath
    [Arguments]    ${xpath}    ${value}
    ${result}=    Execute Javascript    document.evaluate('${xpath}',document.body,null,9,null).singleNodeValue.value='${value}';
    [Return]    ${result}

# ### Keyword: `Fill And Submit The Form`
# This keyword accepts a `${person}` variable, and fills the form on the page with the person's details. Each form element is found using the `Set Value by Xpath` keyword. 

*** Keywords ***
Fill And Submit The Form
    [Arguments]    ${person}
    Set Value By Xpath    //input[@ng-reflect-name="labelFirstName"]    ${person}[First Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelLastName"]    ${person}[Last Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelCompanyName"]    ${person}[Company Name]
    Set Value By Xpath    //input[@ng-reflect-name="labelRole"]    ${person}[Role in Company]
    Set Value By Xpath    //input[@ng-reflect-name="labelAddress"]    ${person}[Address]
    Set Value By Xpath    //input[@ng-reflect-name="labelEmail"]    ${person}[Email]
    Set Value By Xpath    //input[@ng-reflect-name="labelPhone"]    ${person}[Phone Number]
    Click Button    Submit

# ### Task: `Start The Challenge`
# Using the `Open Available Browser` keyword from `RPA.Browser`, the robot will open a new browser and navigate to the challenge website. Then, using the `Download` keyword from `RPA.HTTP`, it will download the Excel file locally, overwriting the file if it happens to exist already. Once the file is downloaded, it will start the challenge using the `Click Button` keyword, provided by the `RPA.Browser` library.

# > Because there are no other buttons with a label of "Start", we can just pass the label to the `Click Button` keyword, and it will just work!

*** Tasks ***
Start The Challenge
    Open Available Browser    http://rpachallenge.com/
    Download    http://rpachallenge.com/assets/downloadFiles/challenge.xlsx    overwrite=True
    Click Button    Start

# ### Task: `Fill the forms`
# 1.  `${people}= Get The List Of People From The Excel File`:
#     Here we are creating a variable, and we are assigning to it the Excel data by using a new keyword that we called `Get The List Of People From The Excel File`.
#
# 2.  Looping over the people data:
#     Here we get the table rows data `@{people}`, and we call the `Fill And Submit The Form` keyword for each row `@{person}`, using a FOR loop.
#     
# 3.  `Fill And Submit The Form ${person}`
#     We call the `Fill And Submit The Form` keyword for each of items in our list. 

*** Tasks ***
Fill The Forms
    ${people}=    Get The List Of People From The Excel File
    FOR    ${person}    IN    @{people}
        Fill And Submit The Form    ${person}
    END

# ### Task: `Collect The Results`
#
# After all the forms have been filled, the site will display a congratulations message with statistics about the accuracy and how long it took to complete the challenge. Looking at HTML source of the page, we can see that the congratulations message has a CSS class of `congratulations`: the robot will take a screenshot of it (`Capture Element Screenshot`), and save it to a file.

*** Tasks ***
Collect The Results
    Capture Element Screenshot    css:div.congratulations
    Close All Browsers
