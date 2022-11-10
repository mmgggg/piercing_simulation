class UsersController < ApplicationController
  before_action :require_login, only: %i[destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'ユーザーの作成に成功しました'
      redirect_to root_path
    else
      flash[:danger] = 'ユーザーの作成に失敗しました'
      render :new
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
  
end

