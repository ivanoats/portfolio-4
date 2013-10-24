class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip, :post_id

  validates :content,      presence: true
  validates :author_email, presence: true
  validates :author,       presence: true
end
