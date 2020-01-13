class Empathy < ApplicationRecord
  belongs_to :user
  belongs_to :bitch
  validates_uniqueness_of :bitch_id, scope: :user_id
end
