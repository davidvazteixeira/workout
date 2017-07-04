class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration_in_min,
    presence: true,
    numericality: {only_integer: true}
  validates :workout,
    presence: true,
    allow_blank: false
  validates :workout_date,
    presence: true,
    allow_blank: false
  validates :user_id,
    presence: true
end
