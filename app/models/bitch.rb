class Bitch < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 200 }
  belongs_to :user
  has_many :empathies, dependent: :destroy
  has_many :empathied_users, through: :empathies, source: :user
end
