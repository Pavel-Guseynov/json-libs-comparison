# frozen_string_literal: true

require_relative '../example'

Oj.add_to_json

class JsonAdd < Example
  self.exceptions = {
    StandardError => 'Segmentation fault'
  }

  def encode_function(data)
    JSON.dump(data)
  end

  def decode_function(data)
    JSON.parse(data)
  end
end

JsonAdd.new.run
