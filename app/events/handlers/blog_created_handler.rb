class BlogCreatedHandler < Events::Handlers::BaseHandler
  def execute(event)
    BlogReport.create!(
      :guid => event.guid,
      :name => event.name,
      :tagline => event.tagline
    )
  end
end