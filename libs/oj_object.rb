# frozen_string_literal: true

require_relative '../example'

class OjObject < Example
  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjObject.new.run
