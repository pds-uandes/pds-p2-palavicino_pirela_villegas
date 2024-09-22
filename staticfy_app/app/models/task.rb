class Task < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :multi_choice_questions
  has_one :numeric_question
end
