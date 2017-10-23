require 'rubygems'
require 'json'

class Configuration < ApplicationRecord
	has_many :ordenations
  attr_accessor :configuration_file
  validates :label, presence: true
  validates :configuration_file, presence: true
  before_save :associate_ordenations
  validate :json_file_has_to_be_valid

  def configuration_file?
    !!@configuration_file
  end

  def json_file_has_to_be_valid
    if @configuration_file.nil?
      errors.add(:configuration_file, ("Choose a json file")) 
      return
    end

    file = @configuration_file.open
    content = file.read
    json_parsed = JSON.parse content
    if json_parsed.empty?
      errors.add(:configuration_file, ("Empty json")) 
    end

    json_parsed.each do |ordenation_dict|
      if ordenation_dict.keys != ["field", "direction"]
         errors.add(:configuration_file, ("Json not corresponding to ordenation"))
      else
        order = Ordenation.new(ordenation_dict)
        unless order.is_valid_without_config?
          puts "-> wtf: #{order.errors.inspect}"
          errors.add(:configuration_file, ("Invalid ordenation"))
        end
      end
    end

    rescue JSON::ParserError => e 
      errors.add(:configuration_file, ("Invalid json")) 
  end

  private
    def associate_ordenations
      if @configuration_file.nil?
        return
      end

      file = @configuration_file.open
      content = file.read
      json_parsed = JSON.parse content
      json_parsed.each do |ordenation_dict|
        self.ordenations.build(ordenation_dict)
      end
    end
end
