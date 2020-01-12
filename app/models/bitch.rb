class Bitch < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 200 }
  belongs_to :user
end
