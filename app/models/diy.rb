class Diy < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :categorys
  mount_uploader :image, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
end
