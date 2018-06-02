# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  post_date  :date
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  is_impressionable

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true
end
