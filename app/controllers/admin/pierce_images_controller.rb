class Admin::PierceImagesController < Admin::BaseController

  def index; end

  def new
    @pierce_image = PierceImage.new
  end

  def create
    @pierce_image = PierceImage.new(pierce_image_params)
    if @pierce_image.save
      flash.now[:notice] = "アップロード成功"
      redirect_to admin_root_path
    else
      flash.now[:danger] = "アップロード失敗"
    end
  end

  def pierce_image_params
    params.require(:pierce_image).permit(:pierce_image_name, :pierce_image)
  end


end

