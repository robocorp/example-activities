## To run this code locally, you need to complete additional setup steps. Check the README.md file for details!
*** Settings ***
Documentation     Excel reader robot. Reads information from a given Excel file and
...               adds it to the work item.
Resource          keywords.robot

*** Tasks ***
Read invitations from Excel file and add them to the work item
    Store invitations in work item
