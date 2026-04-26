class User < ApplicationRecord
  validates :name, presence: true

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
