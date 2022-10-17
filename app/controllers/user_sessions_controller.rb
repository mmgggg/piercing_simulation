class UserSessionsController < ApplicationController
  def new; end

  def index
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = "ログインしました。"
      redirect_back_or_to profile_path(id: current_user.id)
    else
      flash.now[:warning] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end
end
