class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update]

  def index
    @popular_posts = Impression.where(controller_name: 'posts', action_name: 'show')
    .group(:impressionable_id).order('count(*) DESC').limit(8).count.keys
    .map { |id| Post.find(id)}
    @new_posts = Post.order('created_at DESC').limit(8)
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
    tags = params[:tags].split(',').map { |tag| Tag.find_or_create_by(name: tag) }
    @post.tags = tags
    if @post.save
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
