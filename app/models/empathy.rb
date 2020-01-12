class Empathy < ApplicationRecord
  belongs_to :user
  belongs_to :bitch, counter_cache: :empathies_count
end
