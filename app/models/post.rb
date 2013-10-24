class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :post_id, :content
  has_many :comments
  belongs_to :author, class_name: "User"
  scope :published, where(published: true)
  def publish!
    published = true
    save!
  end
end
