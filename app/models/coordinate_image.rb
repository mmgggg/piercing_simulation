class CoordinateImage < ApplicationRecord
  mount_uploader :image, CoordinateImageUploader
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :image, presence: true
  validates :user_id, presence: true
end



