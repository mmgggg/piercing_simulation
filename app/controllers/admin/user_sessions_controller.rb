class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :check_admin, only: %i[new create]
  skip_before_action :require_login, only: %i[new create destroy]
  layout 'admin/layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user 
      flash[:success] = "ログインしました"
      redirect_to admin_root_path
    else
      flash[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to admin_login_path
  end
end
