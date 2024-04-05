# frozen_string_literal: true

require_relative '../example'

Oj.mimic_JSON
Oj.add_to_json

class OjMimicAdd < Example
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

OjMimicAdd.new.run
