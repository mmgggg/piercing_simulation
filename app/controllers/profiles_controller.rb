class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]
  
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "名前を更新しました"
      redirect_to profile_path(current_user.id)
    else
      flash.now[:danger] = "名前の更新に失敗しました"
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end

end
