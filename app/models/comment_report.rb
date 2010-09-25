class CommentReport < ActiveRecord::Base
  scope :pending, where(:approved_at => nil)
  scope :approved, where('approved_at IS NOT NULL')
  scope :guid, lambda {|guid| where(:guid => guid) }
  scope :for, lambda {|post| where(:post_id => post.guid) }
  
  is_gravtastic!
end
