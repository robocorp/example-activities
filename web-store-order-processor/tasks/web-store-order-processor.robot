*** Settings ***
Documentation   Swag order robot. Places orders at https://www.saucedemo.com/
...             by processing a spreadsheet of orders and ordering the
...             specified products using browser automation. Uses environment
...             variables for credentials.
Resource        keywords.robot

*** Tasks ***
Place orders
    Process orders
