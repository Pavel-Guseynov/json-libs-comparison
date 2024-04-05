# frozen_string_literal: true

require_relative '../example'

Oj.add_to_json

class OjAdd < Example
  self.exceptions = {
    StandardError => 'Segmentation fault'
  }

  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjAdd.new.run
