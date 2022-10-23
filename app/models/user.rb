class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :coordinate_images, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, length: {maximum: 255}, uniqueness: true, presence: true

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  #自分の投稿画像かどうか確かめる
  def own?(object)
    object.user_id == id
  end
end