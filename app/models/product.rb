class Product < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: {medium: "300x300#", large: "400x400#"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
