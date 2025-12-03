# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'blog'

  before_action :find_post, only: %i[show edit update]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to posts_path
    else
      render :new, locals: { object: @post }
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to edit_post_path(@post)
    else
      render :edit
    end
  end

  def latest_posts
    @posts = Post.order(created_at: :desc)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
