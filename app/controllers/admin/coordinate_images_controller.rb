class Admin::CoordinateImagesController < Admin::BaseController
  def index
    # @q = Board.ransack(params[:q])
    # @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    @coordinate_images = CoordinateImage.all.page(params[:page])
  end

  def show
    @coordinate_image = CoordinateImage.find(params[:id])
  end

  def edit
    @coordinate_image = CoordinateImage.find(params[:id])
  end

  def update
    @coordinate_image = CoordinateImage.find(params[:id])
    if @coordinate_image.update(coordinate_image_params)
      flash[:success] = "更新しました"
      redirect_to admin_coordinate_images_path
    else
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @coordinate_image = CoordinateImage.find(params[:id])
    @coordinate_image.destroy!
    flash[:success] = "削除しました"
    redirect_to admin_coordinate_images_path
  end

  private
  def coordinate_image_params
    params.require(:coordinate_image).permit(:image, :tag_list)
  end

end
