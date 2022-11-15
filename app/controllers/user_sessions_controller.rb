class UserSessionsController < ApplicationController
  def new; end

  def index
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:secondary] = "ログインしました。"
      redirect_back_or_to profiles_path
    else
      flash.now[:dark] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
end
