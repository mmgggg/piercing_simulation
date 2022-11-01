class Admin::UsersController < Admin::BaseController

  def index
    # @q = User.ransack(params[:q])
    # @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, success: t('.success')
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end
end
