class Admin::BaseController < ApplicationController
  # before_action :check_admin
  # before_action :require_login
  layout 'admin/layouts/application'

  private

  # def not_authenticated
  #   flash[:warning] = "ログインしてください"
  #   redirect_to admin_login_path
  # end

  # def check_admin
  #   unless current_user.admin?
  #     flash[:warning] = "権限がありません"
  #     redirect_to admin_login_path
  #   end
  # end
end
