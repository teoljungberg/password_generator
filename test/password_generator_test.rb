require "minitest/autorun"
require "password_generator"

class PasswordGeneratorTest < Minitest::Test
  def assert_uniq passwd
    count = Hash.new 0
    passwd.split("").each_with_object count do |char, counter|
      counter[char] += 1
    end

    assert count.values.uniq.size == 1, "'#{passwd}' is not uniq"
  end

  def test_ALPHA
    alpha = ("A".."Z").to_a + ("a".."z").to_a
    assert_equal alpha, PasswordGenerator::ALPHA
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
    assert_match exp_match, PasswordGenerator.new.generate
  end

  def test_generate_is_always_uniq
    assert_uniq PasswordGenerator.new.generate
  end

  def test_generate_length_defaults_to_50
    assert_equal 50, PasswordGenerator.new.generate.size
  end

  def test_generate_custom_length
    assert_equal 42, PasswordGenerator.new(length: 42).generate.size
  end

  def test_generate_with_digits
    exp_match          = /[[:lower:]]*[[:upper:]]*[[:digit:]]/
    generated_password = PasswordGenerator.new(digit: 5).generate
    digits             = generated_password.split("").grep(/[[:digit:]]/)

    assert_match exp_match, generated_password
    assert_equal 5, digits.size
  end

  def test_generate_with_punct
    exp_match          = /[[:lower:]]*[[:upper:]]*[[:punct:]]/
    generated_password = PasswordGenerator.new(punct: 4).generate
    puncts             = generated_password.split("").grep(/[[:punct:]]/)

    assert_match exp_match, generated_password
    assert_equal 4, puncts.size
  end
end
