*** Settings ***
Documentation   Invite printer robot. Creates PDF invitations to events based on data it receives
...             from the work item.
Resource        keywords.robot

*** Tasks ***
Create pdf invitations
    Process invitations
