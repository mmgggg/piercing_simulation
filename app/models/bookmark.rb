class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :coordinate_image

  # user_id と board_idの組み合わせを一意性のあるものにしている
  validates :user_id, uniqueness: { scope: :coordinate_image_id }
end
