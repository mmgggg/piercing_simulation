class Admin::PierceImagesController < Admin::BaseController

  def index
    @pierce_images = PierceImage.all
  end

  def new
    @pierce_image = PierceImage.new
  end

  def create
    @pierce_image = PierceImage.new(pierce_image_params)
    if @pierce_image.save
      flash.now[:success] = "アップロード成功"
      redirect_to admin_pierce_images_path
    else
      flash.now[:danger] = "アップロード失敗"
    end
  end

  def destroy
    @pierce_image = PierceImage.find(params[:id])
    @pierce_image.destroy!
    redirect_to admin_pierce_images_path
  end

  def pierce_image_params
    params.require(:pierce_image).permit(:pierce_image_name, :pierce_image)
  end


end

