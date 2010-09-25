class Comment
  attr_reader :guid
  attr_reader :author, :email, :website, :comment
  attr_reader :approved_at
  
  def initialize(guid, author, email, website, comment)
    @guid = guid
    @author, @email, @website, @comment = author, email, website, comment
  end
  
  def approve(time)
    approved_at = time
  end
  
  def approved?
    ! approved_at.nil?
  end
end