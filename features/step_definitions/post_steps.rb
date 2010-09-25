Given /^I have published a blog post "([^"]*)" with content "([^"]*)"$/ do |title, content|
  publish PublishBlogPostCommand.new(:title => title, :content => content)
end

Then /^I should have ([0-9]+) blog posts?$/ do |count|
  PostReport.count.should == count.to_i
end

Then /^I should have ([0-9]+) comments?$/ do |count|
  CommentReport.count.should == count.to_i
end