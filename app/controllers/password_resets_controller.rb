class PasswordResetsController < ApplicationController

  def new; end

  def create
    #@user = User.find_by(email: params[:email])
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:success] = "パスワード変更ためのメールを送信しました"
      redirect_to login_path
    else
      flash[:danger] = "送信失敗"
    end
    # redirect_to login_path
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
      flash[:success] = "パスワードが変更されました"
      redirect_to login_path
    else
      flash.now[:danger] = "パスワード更新ができませんでした"
      render :edit
    end
  end
end

