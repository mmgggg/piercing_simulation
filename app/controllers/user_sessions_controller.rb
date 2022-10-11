class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(simulation_page_path, notice: "ログインしました")
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: "ログアウトしました")
  end
end