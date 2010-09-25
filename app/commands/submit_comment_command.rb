class SubmitCommentCommand
  extend Commands::ActiveModel
  
  initializer :post_id, :author, :email, :website, :comment, :attr_reader => true do
    unless @website.blank?
      # prefix website with 'http://' if missing
      @website = "http://#{@website}" unless @website =~ /^https?:\/\//
    end
  end
  
  validates :post_id, :guid => true, :post_exists => true
  validates_presence_of :author, :email, :comment
  validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_blank => true
end