# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).sorted
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'ユーザーを作成しました'
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
