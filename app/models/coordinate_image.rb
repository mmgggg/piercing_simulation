class CoordinateImage < ApplicationRecord
  mount_uploader :image, CoordinateImageUploader
  belongs_to :user

  validates :image, presence: true
  validates :user_id, presence: true
end



