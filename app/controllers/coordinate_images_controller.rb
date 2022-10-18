class CoordinateImagesController < ApplicationController

  def index
    @coordinate_images = CoordinateImage.all
  end

  def show
  end

  def my_coordinate_image
    @user = User.find(current_user.id)
    @my_coordinate_images = @user.coordinate_images
  end

  def new
    @coordinate_image = CoordinateImage.new
  end

  def create
    @coordinate_image = CoordinateImage.new(coordinate_image_params)
    if @coordinate_image.save
      flash[:success] = "投稿しました"
      redirect_to profile_path(current_user.id)
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def destroy
  end

  private

  def coordinate_image_params
    params.require(:coordinate_image).permit(:image).merge(user_id: current_user.id)
  end
end
