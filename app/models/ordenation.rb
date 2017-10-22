class Ordenation < ApplicationRecord
  belongs_to :configuration
  validates :priority, uniqueness: true
end
