class CommentApprovedHandler < Events::Handlers::BaseHandler
  def execute(event)
    approve_comment(event.comment_id, event.approved_at)
    increment_comment_count_of_post(event.aggregate_id)
  end

private

  def approve_comment(guid, at)
    CommentReport.guid(guid).update_all(['approved_at = ?', at])
  end
  
  def increment_comment_count_of_post(guid)
    PostReport.guid(guid).update_all('comment_count = comment_count + 1')
  end
end