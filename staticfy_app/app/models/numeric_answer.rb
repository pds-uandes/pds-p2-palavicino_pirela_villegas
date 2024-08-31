class NumericAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :numeric_question
end