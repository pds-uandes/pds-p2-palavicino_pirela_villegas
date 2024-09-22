class User < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  after_create :assign_default_courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :multi_choice_answers
  has_many :numeric_answers
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks

  validates :name, presence: { message: "The user should have a name" }
  validates :email, presence: true, uniqueness: { message: "The email has already been taken" }
  validates :encrypted_password, presence: true, length: { minimum: 3, message: "The user's password should have a minimum length of 3 characters" }

  private

  def assign_default_courses
    Course.find_each do |crs|
      user_courses.create(course: crs, progress: 0)
    end
  end
end
