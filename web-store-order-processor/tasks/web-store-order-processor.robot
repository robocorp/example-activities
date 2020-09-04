# ## Web store order robot example
# This example is explained in detail <a href="https://hub.robocorp.com/knowledge-base/tutorials/web-store-order-robot-tutorial/">here</a>.
#
# > !! **To run this code locally, you need to complete additional setup steps. Check the README.md file or the  <a href="https://hub.robocorp.com/knowledge-base/tutorials/web-store-order-robot-tutorial/">tutorial page</a> for details!**
#

*** Settings ***
Documentation     Swag order robot. Places orders at https://www.saucedemo.com/
...               by processing a spreadsheet of orders and ordering the
...               specified products using browser automation. Uses local or
...               cloud vault for credentials.
Resource          keywords.robot

*** Tasks ***
Place orders
    Process orders
