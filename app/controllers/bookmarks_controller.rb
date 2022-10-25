class BookmarksController < ApplicationController
  before_action :require_login
  
  def create
    coordinate_image = CoordinateImage.find(params[:coordinate_image_id])
    current_user.bookmark(coordinate_image)
    flash[:success] = "お気に入りに保存しました"
    redirect_to coordinate_images_path
  end

  def destroy
    # 中間テーブルを取り出して、そのboardを取り出している。belong_toで紐づいているからboardで取り出せる。
    coordinate_image = current_user.bookmarks.find(params[:id]).coordinate_image
    current_user.unbookmark(coordinate_image)
    # 元々のコード　current_user.bookmarks.find(params[:id]).destroy!
    flash[:success] = "お気に入りを削除しました"
    redirect_to coordinate_images_path
  end

end
