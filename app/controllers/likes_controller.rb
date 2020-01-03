class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @post.like(current_user)
  end

  def destroy
    @post = Like.find(params[:id]).post
    @post.unlike(current_user)
  end
end