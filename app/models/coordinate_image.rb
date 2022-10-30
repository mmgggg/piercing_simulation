class CoordinateImage < ApplicationRecord
  mount_uploader :image, CoordinateImageUploader
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  acts_as_taggable

  validates :image, presence: true
  validates :user_id, presence: true
end



