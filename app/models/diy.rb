class Diy < ApplicationRecord
  acts_as_taggable
  mount_uploader :video, VideoUploader
  validates :title, :video, :presence => true
end
