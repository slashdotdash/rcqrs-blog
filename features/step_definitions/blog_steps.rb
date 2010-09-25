Given /^I have created a blog "([^\"]*)"$/ do |name|
  publish CreateBlogCommand.new(:name => name, :tagline => 'blogs are fun')
end

Given /^I have not created a blog$/ do
  # no-op
end

Then /^a new blog should be created$/ do
  BlogReport.count.should == 1
end

def publish(command)
  Rcqrs::Gateway.publish(command)
end