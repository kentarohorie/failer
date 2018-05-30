class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  def show
    @posts = @tag.posts
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
