class BookmarksController < ApplicationController
  before_action :require_login
  
  def create
    @coordinate_image = CoordinateImage.find(params[:coordinate_image_id])
    current_user.bookmark(@coordinate_image)
    # flash[:success] = "お気に入りに保存しました"
    # redirect_to coordinate_images_path
  end

  def destroy
    @coordinate_image = current_user.bookmarks.find(params[:id]).coordinate_image
    current_user.unbookmark(@coordinate_image)
    # flash[:success] = "お気に入りを削除しました"
    # redirect_to coordinate_images_path
  end

end
