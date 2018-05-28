class ApplicationController < ActionController::Base

  private

  def not_authenticated
    redirect_to posts_path
  end
end
