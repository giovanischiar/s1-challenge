class Ordenation < ApplicationRecord
  belongs_to :configuration
  validate :direction_has_to_be_valid
  validate :field_has_to_be_book_field

  def direction_has_to_be_valid
  # puts "%" * 100
  #   puts self.direction
  #   puts ["asc", "desc", ""].include?(self.direction)
  #   puts "%" * 100
  	if !["asc", "desc", ""].include?(self.direction)
      puts "wtf: #{self.direction}"
  		errors.add(:direction, ("Direction invalid"))
  	end
  end

  def field_has_to_be_book_field
    # puts "*" * 100
    # puts self.field
    # puts Book.attribute_names.include?(self.field)
    # puts "*" * 100
  	if !Book.attribute_names.include?(self.field)
      puts "wtf: #{self.field}"
  	  errors.add(:field, ("Field has to be a book field"))
  	end
  end

end
