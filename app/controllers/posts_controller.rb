class PostsController < ApplicationController
  def index
    #render :index, locals: { posts: posts }
    @posts = Post.page(params[:page]).per(10)
  end

  def new
    render :new
  end

  def create
    new_post = Post.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    post = Post.find(params[:id])
    render :edit, locals: { post: post }
  end

  def update
    update_post = Post.find(params[:id])
    update_post.update( title: params["title"], content: params["content"])

    redirect_to :root
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :root
  end
end
