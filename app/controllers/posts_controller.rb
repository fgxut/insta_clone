# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def index
    @posts = if logged_in?
               current_user.feed.includes(:user).page(params[:page]).sorted
             else
               Post.all.includes(:user).page(params[:page]).sorted
             end
    @list_users = User.limit(5).sorted
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).sorted
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '投稿を更新しました'
    else
      flash.now[:danger] = '投稿の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, success: '投稿を削除しました'
  end

  def search
    @search_params = post_search_params
    if @search_params.blank?
      @posts = Post.all.includes(:user).page(params[:page])
    else
      @posts = Post.where('content LIKE ?', "%#{@search_params[:content]}%").page(params[:page])
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, images: [])
  end

  def post_search_params
    params.fetch(:search, {}).permit(:content)
  end
end
