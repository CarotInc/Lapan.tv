class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :diy
end
