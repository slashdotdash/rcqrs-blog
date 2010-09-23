class PostReport < ActiveRecord::Base
  scope :published, lambda { where("published_at IS NOT NULL AND published_at <= ?", Time.zone.now) }
  scope :recent, published.order(:published_at)
end