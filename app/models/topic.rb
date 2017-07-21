class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
end
