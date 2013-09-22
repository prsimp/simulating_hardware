require 'bundler'
Bundler.require
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/signals'
require './lib/gates/nor_gate'

class NorGateTest < MiniTest::Unit::TestCase

  include Hardware::Signals

  def gate
    @gate ||= NorGate.new
  end

  def assert_high(pin)
    assert_equal HIGH, pin
  end

  def assert_low(pin)
    assert_equal LOW, pin
  end

  def test_it_outputs_true_when_inputs_are_low
    gate.input_a = LOW
    gate.input_b = LOW
    assert_high gate.output
  end

  def test_it_outputs_false_when_input_a_is_high_and_b_is_low
    gate.input_a = HIGH
    gate.input_b = LOW
    assert_low gate.output
  end

  def test_it_outputs_false_when_input_a_is_low_and_b_is_high
    gate.input_a = LOW
    gate.input_b = HIGH
    assert_low gate.output
  end

  def test_it_outputs_false_when_both_inputs_are_high
    gate.input_a = HIGH
    gate.input_b = HIGH
    assert_low gate.output
  end

end