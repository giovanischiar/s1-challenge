require 'rubygems'
require 'json'

class Configuration < ApplicationRecord
	has_many :ordenations
  attr_accessor :configuration_file
  before_save :associate_ordenations

  def configuration_file?
    !!@configuration_file
  end

  private

    def associate_ordenations
      file = @configuration_file.open
      content = file.read
      json_parsed = JSON.parse content
      json_parsed.each do |ordenation_dict|
        self.ordenations.build(ordenation_dict)
      end
    end
end
