class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(target_params)

    if @user.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def destroy
  end

  def edit
  end

  private

  def target_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      :twitter
    )
  end
end
