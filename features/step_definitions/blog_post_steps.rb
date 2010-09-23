Then /^a new blog post should be published$/ do
  assert_equal 1, PostReport.count
end