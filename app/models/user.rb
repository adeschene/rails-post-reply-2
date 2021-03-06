class User < ApplicationRecord
  attr_accessor :login # Basically gives us [:username, :email] in the single attribute :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy

  # For allowing a user to login with username OR email
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {
      value: login.strip.downcase
    }]).first
  end
end
