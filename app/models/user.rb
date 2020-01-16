class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bitches, dependent: :destroy
  has_many :empathies, dependent: :destroy
  has_many :empathied_bitches, through: :empathies, source: :post
  def already_empathied?(bitch)
    self.empathies.exists?(bitch_id: bitch.id)
  end
end
