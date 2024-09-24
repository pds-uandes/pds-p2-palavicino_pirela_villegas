class Task < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :multi_choice_questions
  has_one :numeric_question

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  def name_with_course
    "#{name} (#{course.name})"
  end
end
