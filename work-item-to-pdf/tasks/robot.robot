# ## PDF Invite printer 
# ### Part2: Work Item To PDF
#
# This example is explained in detail <a href="https://hub.robocorp.com/knowledge-base/tutorials/pdf-invites-printer-tutorial/">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the  <a href="https://hub.robocorp.com/knowledge-base/tutorials/pdf-invites-printer-tutorial/">tutorial page</a> for details!**
#

*** Settings ***
Documentation     Invite printer robot. Creates PDF invitations to events based on data it receives
...               from the work item.
Resource          keywords.robot

*** Tasks ***
Create PDF invitations
    Process invitations
