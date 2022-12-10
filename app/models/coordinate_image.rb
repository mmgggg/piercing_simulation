class CoordinateImage < ApplicationRecord
  mount_uploader :image, CoordinateImageUploader
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  acts_as_taggable

  validates :user_id, presence: true
  validate :required_either_image_or_for_post_image_url


  def required_either_image_or_for_post_image_url
    # 演算子 ^ で排他的論理和（XOR）にしています
    return if image.present? ^ for_post_image_url.present?
    errors.add(:base, '画像の情報が入力できていません')
  end
  
end



