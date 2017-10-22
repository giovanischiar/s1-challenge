class Ordenation < ApplicationRecord
  belongs_to :configuration
  validates :priority, uniqueness: { scope: :configuration_id }
end
