class CoordinateImagesController < ApplicationController

  def show
  end

  def index
  end

  def new
    @coordinate_image = CoordinateImage.new
  end

  def create
    @coordinate_image = CoordinateImage.new(coordinate_image_params)
    if @coordinate_image.save
      flash[:success] = "投稿しました"
      redirect_to login_path
    else
      flash.now[:danger] = "投稿できませんでした"
      render :new
    end
  end

  def destroy
  end

  private

  def coordinate_image_params
    params.require(:coordinate_image).permit(:image)
  end
end
