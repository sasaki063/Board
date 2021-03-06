class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
      @post = Post.new(user_id: current_user.id)
      @post.save
  end

  def create
      @post = Post.create(post_params)
      redirect_to post
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      post.update(post_params)
      redirect_to post
  end

  def destroy
      post = Post.find(params[:id])
      post.delete
      redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:name, :category)
    end

  end
