Feature: Manage blog posts
	As a blogger
  I want to be able to create a new blog
  So that I can then create content

	Scenario: blank slate forces blog creation
		Given I have not created a blog
		When I go to the home page
		Then I should be on the create blog page