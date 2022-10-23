class CoordinateImagesController < ApplicationController
  before_action :require_login, only: %i[my_coordinate_image create destroy]

  def index
    @coordinate_images = CoordinateImage.all.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def my_coordinate_image
    @user = User.find(current_user.id)
    @my_coordinate_images = @user.coordinate_images.order(created_at: :desc).page(params[:page])
  end

  def new
    @coordinate_image = CoordinateImage.new
  end

  def create
    @coordinate_image = CoordinateImage.new(coordinate_image_params)
    if @coordinate_image.save
      flash[:success] = "投稿しました"
      redirect_to my_coordinate_images_path(current_user.id)
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def destroy
    @coordinate_image = current_user.coordinate_images.find(params[:id])
    @coordinate_image.destroy!
    flash[:success] = "削除しました"
    redirect_to my_coordinate_images_path
  end

  private

  def coordinate_image_params
    params.require(:coordinate_image).permit(:image).merge(user_id: current_user.id)
  end
end
