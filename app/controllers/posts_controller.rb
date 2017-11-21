class PostsController < ApplicationController

  before_action :set_post, only: [:show]

  def index

  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]  = "Post was created successfully."
      redirect_to @post ## goto show page
    else
      render :new
    end
  end

  def show

  end

  private
  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
