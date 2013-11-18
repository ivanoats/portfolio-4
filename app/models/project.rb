class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :image

  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }
  mount_uploader :image, ImageUploader
end
