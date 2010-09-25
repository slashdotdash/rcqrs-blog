module ApplicationHelper
  def flash_helper
    [:notice, :warning, :message].map { |f| content_tag(:div, flash[f], :class => f) if flash[f] }
  end
end
