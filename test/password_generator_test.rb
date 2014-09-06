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

  def test_generate_custom_length
    assert_equal 18, PasswordGenerator.generate(length: 18).size
  end

  def test_generate_with_digits
    exp_match          = /[[:lower:]]*[[:upper:]]*[[:digit:]]/
    generated_password = PasswordGenerator.generate(digit: 5)
    digits             = generated_password.split("").grep(/[[:digit:]]/)

    assert_match exp_match, generated_password
    assert_equal 5, digits.size
  end

  def test_generate_with_punct
    exp_match          = /[[:lower:]]*[[:upper:]]*[[:punct:]]/
    generated_password = PasswordGenerator.generate(punct: 4)
    puncts             = generated_password.split("").grep(/[[:punct:]]/)

    assert_match exp_match, generated_password
    assert_equal 4, puncts.size
  end
end
