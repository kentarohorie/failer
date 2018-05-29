class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(target_params)
    if @post.save
      params[:tags].split(',').each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to posts_path
    else
      flash.now[:alert] = '投稿に失敗しました。'
      render action: :new
    end
  end

  def update
    if @post.update(target_params)
      redirect_to post_path(@post)
    else
      flash.now[:alert] = '更新に失敗しました。'
      render action: :edit
    end
  end

  def destroy
    @post.destroy
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def target_params
      params.require(:post).permit(:title, :post_date, :content)
    end
end
