class Empathy < ApplicationRecord
  belongs_to :user
  belongs_to :bitch
  counter_culture :bitch, column_name: 'score'
  validates_uniqueness_of :bitch_id, scope: :user_id
end
