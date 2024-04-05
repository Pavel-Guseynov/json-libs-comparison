# frozen_string_literal: true

require_relative '../example'

Oj.default_options = { mode: :rails }

class OjRails < Example
  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjRails.new.run
