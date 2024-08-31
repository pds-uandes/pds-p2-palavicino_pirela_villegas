class MultiChoiceQuestion < ApplicationRecord
  belongs_to :task
  has_many :multi_choice_answers
end