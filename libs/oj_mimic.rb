# frozen_string_literal: true

require_relative '../example'

Oj.mimic_JSON

class OjMimic < Example
  self.exceptions = {
    Complex => 'stack level too deep (SystemStackError)',
    Rational => 'stack level too deep (SystemStackError)'
  }

  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjMimic.new.run
