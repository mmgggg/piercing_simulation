class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[edit update]
  
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "更新しました"
      redirect_to profiles_path
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end
  end

  private
  #editアクションを起こすためにset_userをセット
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end

end
