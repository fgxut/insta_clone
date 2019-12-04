class PostsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def index
    @posts = Post.all
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

  private

    def post_params
      params.require(:post).permit(:content, images: [])
    end
end
