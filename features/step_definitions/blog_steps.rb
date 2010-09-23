Given /^I have created a blog "([^\"]*)"$/ do |name|
  command = CreateBlogCommand.new(:name => name, :tagline => 'blogs are fun')
  Rcqrs::Gateway.publish(command)
end

Given /^I have not created a blog$/ do
  # no-op
end

When /^I enter the blog name "([^\"]*)"$/ do |name|
  fill_in('command_name', :with => name)
end

Then /^a new blog should be created$/ do
  assert_equal 1, BlogReport.count
end