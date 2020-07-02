## To run this code locally, you need to complete additional setup steps. Check the README.md file for details!
*** Settings ***
Documentation     Invite printer robot. Creates PDF invitations to events based on data it receives
...               from the work item.
Resource          keywords.robot

*** Tasks ***
Create PDF invitations
    Process invitations
