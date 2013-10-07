Feature:
	As a user
	I want to navigate to a url
	So that I can capture a screenshot


 # Scenario: "Capture screenshot for one device and platform"
 	# Given I am on the home page
 	# When I login
 	# Then a screenshot is captured

 Scenario: "Capture screenshots of the pillar page"
 	Given I am on the Pillar Home Page
 	When I click the connect link
 	And I fill in the Contact Us page and don't send it
 	Then a screenshot is captured