# frozen_string_literal: true

DATA_TYPES = [
  { class: Integer, example: 1 },
  { class: Float, example: 1.0 },
  { class: String, example: 'a' },
  { class: Symbol, example: :a },
  { class: TrueClass, example: true },
  { class: FalseClass, example: false },
  { class: NilClass, example: nil },
  { class: Array, example: [1, 2, 3] },
  { class: Hash, example: { b: 1, c: 2 } },
  { class: BigDecimal, example: BigDecimal('1.0') },
  { class: Complex, example: 1 + 2i },
  { class: Rational, example: 1/2r },
  { class: Date, example: Date.new(1, 1, 1) },
  { class: Time, example: Time.new(1) },
  { class: DateTime, example: DateTime.new(1, 1, 1) },
  { class: StandardError, example: StandardError.new('error') },
  { class: Object, example: Object.new },
  { class: Class, example: Class.new },
  { class: Module, example: Module.new },
  { class: Struct, example: Struct.new(:a) },
  { class: OpenStruct, example: OpenStruct.new(a: 1) },
  { class: Range, example: 1..10 },
  { class: Regexp, example: /\d\w/ },
  { class: 'Unicode', example: 'Andróg' }
].freeze
