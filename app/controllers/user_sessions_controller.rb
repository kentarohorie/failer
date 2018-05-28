class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      flash.now[:alert] = 'ログインしました。'
      redirect_to posts_path
    else
      @user = User.new
      flash.now[:alert] = 'ログインに失敗しました。'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to posts_path
  end
end
