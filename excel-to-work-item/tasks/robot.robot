# ## PDF Invite printer
# ### Part1: Excel To Work Item
#
# This example is explained in detail <a href="https://hub.robocorp.com/knowledge-base/tutorials/pdf-invites-printer-tutorial/">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the <a href="https://hub.robocorp.com/knowledge-base/tutorials/pdf-invites-printer-tutorial/">tutorial page</a> for details!**
#

*** Settings ***
Documentation     Excel reader robot. Reads information from a given Excel file and
...               adds it to the work item.
Resource          keywords.robot

*** Tasks ***
Read invitations from Excel file and add them to the work item
    Store invitations in work item
