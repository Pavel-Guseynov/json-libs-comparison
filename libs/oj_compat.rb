# frozen_string_literal: true

require_relative '../example'

Oj.default_options = { mode: :compat }

class OjCompat < Example
  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjCompat.new.run
