class Content
  attr_reader :raw, :html
  
  def initialize(raw, html)
    @raw, @html = raw, html
  end
end