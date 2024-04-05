# frozen_string_literal: true

require_relative '../example'

Oj.optimize_rails

class JsonRails < Example
  def encode_function(data)
    JSON.dump(data)
  end

  def decode_function(data)
    JSON.parse(data)
  end

  def measure_performance
    p 'Oj.optimize_rails invalidates ips results'
  end
end

JsonRails.new.run
