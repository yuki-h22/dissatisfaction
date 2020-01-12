class Bitch < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 200 }
  belongs_to :user
  has_many :empathies, dependent: :destroy
  def empathies_user(user_id)
    empathies.find_by(user_id: user_id)
  end
end
