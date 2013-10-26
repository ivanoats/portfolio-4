class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  attr_accessible :title, :body, :published
  scope :published, where(published: true)
  def publish!
    published = true
    save!
  end
end
