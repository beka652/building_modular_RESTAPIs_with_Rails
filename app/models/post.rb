class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { in: 5..100 }
  belongs_to :user
  has_many :comments, dependent: :destroy
end
