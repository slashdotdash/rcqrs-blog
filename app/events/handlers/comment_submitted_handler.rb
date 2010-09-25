class CommentSubmittedHandler < Events::Handlers::BaseHandler
  def execute(event)
    CommentReport.create!(
      :guid => event.guid,
      :post_id => event.post_id,
      :post_title => event.post_title,
      :author => event.author, 
      :email => event.email, 
      :website => event.website, 
      :comment => event.comment
    )
  end
end