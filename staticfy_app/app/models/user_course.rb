class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :progress, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
  validates :course_id, presence: true
end
