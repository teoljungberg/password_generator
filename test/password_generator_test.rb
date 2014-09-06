require "minitest/autorun"
require "password_generator"

class PasswordGeneratorTest < Minitest::Test
  def test_LOWER
    assert_equal ("a".."z").to_a, PasswordGenerator::LOWER
  end

  def test_UPPER
    assert_equal ("A".."Z").to_a, PasswordGenerator::UPPER
  end

  def test_DIGIT
    assert_equal ("0".."9").to_a, PasswordGenerator::DIGIT
  end

  def test_PUNCT
    skip "find character range for punct characters"
    assert_equal ("!".."|").to_a, PasswordGenerator::PUNCT
  end

  def test_generate
    exp_match = /[[:lower:]]*[[:upper:]]/
    assert_match exp_match, PasswordGenerator.generate
  end

  def test_generate_length_defaults_to_50
    assert_equal 50, PasswordGenerator.generate.size
  end
end
