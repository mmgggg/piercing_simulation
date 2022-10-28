class ApplicationController < ActionController::Base
  add_flash_types :success, :danger

  private
   def not_authenticated
      flash[:danger] = "ログインが必要です"
      redirect_to login_path
   end
end
