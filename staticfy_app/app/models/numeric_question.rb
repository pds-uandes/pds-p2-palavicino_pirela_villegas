class NumericQuestion < ApplicationRecord
  belongs_to :task
  has_many :numeric_answers
  has_one :numeric_template
end