# frozen_string_literal: true

require_relative '../example'

Oj.default_options = { mode: :strict }

class OjStrict < Example
  self.exceptions = {
    Complex => 'TypeError',
    Rational => 'TypeError',
    Date => 'TypeError',
    Time => 'TypeError',
    DateTime => 'TypeError',
    StandardError => 'TypeError',
    Object => 'TypeError',
    Class => 'TypeError',
    Module => 'TypeError',
    Struct => 'TypeError',
    OpenStruct => 'TypeError',
    Range => 'TypeError',
    Regexp => 'TypeError'
  }

  def encode_function(data)
    Oj.dump(data)
  end

  def decode_function(data)
    Oj.load(data)
  end
end

OjStrict.new.run
