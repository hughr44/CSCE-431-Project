Feature: Add a page where current admins can manage events 
  As an officer of TDAC
  So officers can create/delete events
  I want the ability to add or delete an event
  
  Scenario: Officer adds an event to a page
    When officer goes to event page where admins can manage events
    When officer inputs event name and description
    And officer presses the create button
    Then event is added to event page