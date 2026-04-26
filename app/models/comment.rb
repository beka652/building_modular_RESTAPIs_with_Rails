class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :post
end
