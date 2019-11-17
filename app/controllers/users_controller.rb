# frozen_string_literal: true

class UsersController < ApplicationController
  protect_from_forgery
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを作成しました'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
