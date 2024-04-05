# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __dir__)
require 'bundler/setup' # Set up gems listed in the Gemfile.
Bundler.require

require 'active_support'
require 'active_support/core_ext'

require_relative 'input/ruby_data_types'
require_relative 'input/ruby_basic_example'
require_relative 'input/ruby_big_example'
require_relative 'input/json_data_types'
require_relative 'input/json_basic_example'
require_relative 'input/json_big_example'

class Example
  class_attribute :exceptions, default: {}

  attr_accessor :decode_output, :encode_output

  def initialize
    @decode_output = File.open("output/#{self.class}.decode", 'w')
    @encode_output = File.open("output/#{self.class}.encode", 'w')
  end

  def run
    encode_output.puts encode
    decode_output.puts Marshal.dump(decode)

    measure_performance
  end

  private

  def encode
    DATA_TYPES.map do |type|
      if exceptions[type[:class]]
        encode_function(type[:example].to_s)
      else
        encode_function(type[:example])
      end
    end
  end

  def decode
    JSON_DATA_TYPES.map do |type|
      decode_function(type)
    end
  end

  def measure_performance
    Benchmark.ips do |x|
      x.iterations = 3
      x.time = 16

      x.report(self.class) do
        32.times do
          encode
          decode
        end

        64.times do
          encode_function(RUBY_BASIC_EXAMPLE)
          decode_function(JSON_BASIC_EXAMPLE)
        end

        2.times do
          encode_function(RUBY_BIG_EXAMPLE)
          decode_function(JSON_BIG_EXAMPLE)
        end
      end

      x.save! 'output/performance'
    end
  end
end
