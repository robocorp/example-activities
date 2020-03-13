*** Settings ***
Documentation   An example activity. Opens a web page and stores some content.
...             The web page text is stored in the "output" directory.
...             An image screenshot is embedded in the log.
Resource        keywords.robot

*** Tasks ***
Store web page content
    Store web page content
