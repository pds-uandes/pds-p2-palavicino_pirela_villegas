class MultiChoiceAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :multi_choice_question
end