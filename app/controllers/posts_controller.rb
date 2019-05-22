class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
   @post = Post.new(allowed_params)
   if @post.valid?
     @post.save
     redirect_to posts_path
   else
     render :new
   end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(allowed_params).valid?
    @post.update!
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def allowed_params
    params.require(:post).permit(:title, :content, :summary, :category)
  end

end
