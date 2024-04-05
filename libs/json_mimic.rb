# frozen_string_literal: true

require_relative '../example'

Oj.mimic_JSON

class JsonMimic < Example
  def encode_function(data)
    JSON.dump(data)
  end

  def decode_function(data)
    JSON.parse(data)
  end
end

JsonMimic.new.run
