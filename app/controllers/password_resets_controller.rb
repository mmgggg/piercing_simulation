class PasswordResetsController < ApplicationController

  def new; end

  def create
    #@user = User.find_by(email: params[:email])
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:notice] = "パスワード変更ためのメールを送信しました"
      redirect_to login_path
    else
      flash[:dark] = "送信できませんでした"
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    #パスワード確認用
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      flash[:secondary] = "パスワードが変更されました"
      redirect_to login_path
    else
      flash.now[:dark] = "パスワード更新ができませんでした"
      render :edit
    end
  end
end

