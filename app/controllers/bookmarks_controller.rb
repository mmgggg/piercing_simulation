class BookmarksController < ApplicationController
  before_action :require_login
  
  def create
    @coordinate_image = CoordinateImage.find(params[:coordinate_image_id])
    current_user.bookmark(@coordinate_image)
  end

  def destroy
    @coordinate_image = current_user.bookmarks.find(params[:id]).coordinate_image
    current_user.unbookmark(@coordinate_image)
  end

end
