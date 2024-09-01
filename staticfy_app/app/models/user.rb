class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :multi_choice_answers
  has_many :numeric_answers

  validates :name, presence: { message: "The user should have a name" }
  validates :email, presence: true, uniqueness: { message: "The email has already been taken" }
  validates :encrypted_password, presence: true, length: { minimum: 3, message: "The user's password should have a minimum length of 3 characters" }
end
