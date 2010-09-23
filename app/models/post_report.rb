class PostReport < ActiveRecord::Base
  scope :published, lambda { where("published_at IS NOT NULL AND published_at <= ?", Time.zone.now) }
  scope :recent, published.order(:published_at)
  
  def self.by_slug(params)
    published.where(
      :year => params[:year], :month => params[:month], :day => params[:day], :slug => params[:slug]
    ).first
  end
end