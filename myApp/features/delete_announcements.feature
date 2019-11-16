Feature: Give officers a way to delete announcements
  As a officer of TDAC
  So that unwanted announcements are not seen by the members
  I want the ability to delete an event

    Scenario: Create an announcements page
      When officer goes to announcements page
      Then officer clicks delete
      Then announcement is deleted