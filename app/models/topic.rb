class Topic < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  validates :title, :description, presence: true
end
