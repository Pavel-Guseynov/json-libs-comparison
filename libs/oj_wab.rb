# frozen_string_literal: true

require_relative '../example'

Oj.default_options = { mode: :wab }

RUBY_BASIC_EXAMPLE = RUBY_BASIC_EXAMPLE.deep_symbolize_keys
RUBY_BIG_EXAMPLE = RUBY_BIG_EXAMPLE.deep_symbolize_keys

class OjWab < Example
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

OjWab.new.run
