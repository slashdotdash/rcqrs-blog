Feature: Read blog
	As a reader
  I want to be able to read blog articles
  So that I have gained knowledge

  Scenario: Read blog article
    Given I have created a blog "rcqrs-rails"
		And I have published a blog post "CQRS in Ruby" with content "Discover CQRS"
		When I am on the home page
		Then I should see "CQRS in Ruby" within ".content h2.title"
		And I should see "Discover CQRS" within ".content .entry"
		
	Scenario: Comment on blog post
		Given I have created a blog "rcqrs-rails"
		And I have published a blog post "CQRS in Ruby" with content "Discover CQRS"
		When I go to view the blog post "CQRS in Ruby"
		And I fill in "command_author" with "Ben Smith"
		And I fill in "command_email" with "ben@slashdotdash.net"
		And I fill in "command_website" with "www.slashdotdash.net"
		And I fill in "command_comment" with "My comment"
    And I press "Submit"
 		Then I should see "Comment accepted, pending approval" within ".notice"
		And I should have 1 comment