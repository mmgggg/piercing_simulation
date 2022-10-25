class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :coordinate_images, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_coordinate_images, through: :bookmarks, source: :coordinate_image

  #sorcery
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  #ユーザー登録
  validates :email, uniqueness: true, presence: true
  validates :name, length: {maximum: 255}, uniqueness: true, presence: true

  #パスワードリセット機能
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true


  #自分の投稿画像かどうか確かめる
  def own?(object)
    object.user_id == id
  end

  #引数のimageがbookmarkされているものか確かめる
  def bookmark?(coordinate_image)
    bookmark_coordinate_images.include?(coordinate_image)
  end

  #bookmarkする(配列の中に入れる)
  def bookmark(coordinate_image)
    bookmark_coordinate_images << coordinate_image
  end

  #bookmarkを解除
  def unbookmark(coordinate_image)
    bookmark_coordinate_images.destroy(coordinate_image)
  end

end
