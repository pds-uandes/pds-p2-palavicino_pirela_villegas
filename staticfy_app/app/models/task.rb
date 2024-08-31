class Task < ApplicationRecord
  belongs_to :user
  has_many :multi_choice_questions
  has_one :numeric_question
end