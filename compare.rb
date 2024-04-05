# frozen_string_literal: true

require 'benchmark/ips'

Benchmark.ips do |x|
  x.save! 'output/performance'
  x.compare!
end
