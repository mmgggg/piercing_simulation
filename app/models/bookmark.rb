class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :coordinate_image

  validates :user_id, uniqueness: { scope: :coordinate_image_id }
end
