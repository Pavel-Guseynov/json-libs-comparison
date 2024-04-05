# frozen_string_literal: true

require_relative '../example'

class Json < Example
  def encode_function(data)
    JSON.dump(data)
  end

  def decode_function(data)
    JSON.parse(data)
  end
end

Json.new.run
