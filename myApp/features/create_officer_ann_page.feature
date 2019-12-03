Feature: Give officers a way to delete announcements
  As a officer of TDAC
  So that unwanted announcements are not seen by the members
  I want the ability to delete an event

    Scenario: Create an officers announcements page
      When officer goes to homepage
      Then officer clicks on Management Pages
      Then officer clicks on Manage Managements
      Then officer should arrive at officer management page
