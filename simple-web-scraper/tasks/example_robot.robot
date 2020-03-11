*** Settings ***
Documentation   An example robot. Opens a web page and stores some content.
...             The web page text is stored in the "output" directory.
...             An image screenshot is embedded in the log.
Resource        example_keywords.resource

*** Tasks ***
Store web page content
    Store web page content
