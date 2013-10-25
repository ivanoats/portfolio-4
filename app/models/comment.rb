
class Comment < ActiveRecord::Base
  attr_accessible :approved, :author, :author_email, :author_url,
                   :content, :referrer, :user_agent, :user_ip, :post_id,
                   :commmentable_id, :commentable, :comment

  belongs_to :commentable, polymorphic: true
  validates :content,      presence: true
  validates :author_email, presence: true
  validates :author,       presence: true
end
