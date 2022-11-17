class SimulationController < ApplicationController

  # def main
  #   @pierce_image = PierceImage.where.not(pierce_image: nil)
  # end

  def new
    @coordinate_image = CoordinateImage.new
  end

  def create
    @coordinate_image = CoordinateImage.new
    @coordinate_image.user = current_user
    @coordinate_image.for_post_image_url = params['for_post_image_url']
    if @coordinate_image.save
      flash[:secondary] = "投稿しました"
      redirect_to my_coordinate_images_path(current_user.id)
    else
      flash.now[:dark] = "投稿できませんでした"
      render :main
    end
  end

  private

  def coordinate_image_params
    params.require(:coordinate_image).permit(:for_post_image_url).merge(user_id: current_user.id)
  end

end
