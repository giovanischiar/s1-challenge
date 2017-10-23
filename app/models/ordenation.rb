class Ordenation < ApplicationRecord
  belongs_to :configuration
  validates :field, presence: true
  validates :direction, presence: true
  validates :field, uniqueness: {scope: :configuration_id, message: "
    Should be one field per configuration"}

  validate :direction_has_to_be_valid
  validate :field_has_to_be_book_field

  def direction_has_to_be_valid
  	if !["asc", "desc", ""].include?(self.direction)
  		errors.add(:direction, ("Direction invalid"))
  	end
  end

  def field_has_to_be_book_field
  	if !Book.attribute_names.include?(self.field)
  	  errors.add(:field, ("Field has to be a book field"))
  	end
  end

  def is_valid_without_config?
    self.valid?
    errors = self.errors
    details_config_error = {:configuration=>[{:error=>:blank}]}
    errors.details == details_config_error
  end

end
