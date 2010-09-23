Feature: Manage blog posts
	As a blogger
  I want to be able to create and edit blog articles
  So that I have content for readers of my blog 

  Scenario: Publish new blog post
    Given I have created a blog "rcqrs-rails"
		And I am on the publish post page
		When I fill in "command_title" with "CQRS FTW!"
		And I fill in "command_content" with "Discover command-query responsibility segregation"
    And I press "Publish"
		Then a new blog post should be published
		
	Scenario: Edit existing blog post
	Scenario: Delete existing blog post