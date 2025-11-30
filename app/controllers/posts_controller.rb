# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'blog'

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def latest_posts
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
