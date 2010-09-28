class BlogPostPublishedHandler < Events::Handlers::BaseHandler
  def execute(event)
    PostReport.create!(
      :guid => event.guid,
      :title => event.title,
      :raw_content => event.raw_content,
      :html_content => event.html_content,
      :published_at => event.published_at,
      :year => event.published_at.year,
      :month => event.published_at.month,
      :day => event.published_at.day,
      :slug => event.title.to_url
    )
  end
end