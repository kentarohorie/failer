class ApplicationController < ActionController::Base
  before_action :set_popular_tags
  impressionist

  private

  def not_authenticated
    redirect_to posts_path
  end

  def set_popular_tags
    @popular_tags = PostTag.group(:tag_id).
                            order('count(*) DESC').
                            limit(5).
                            count.
                            keys.
                            map { |tag_id| Tag.find(tag_id) }
  end
end
