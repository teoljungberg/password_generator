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
    generator   = PasswordGenerator.new digit: 4
    password    = generator.generate
    digit_match = password.split("").grep(/[[:digit:]]/)

    assert_equal 4, generator.digits.size
    assert_equal 4, digit_match.size
  end

  def test_generate_with_punct
    generator   = PasswordGenerator.new punct: 4
    password    = generator.generate
    punct_match = password.split("").grep(/[[:punct:]]/)

    assert_equal 4, generator.puncts.size
    assert_equal 4, punct_match.size
  end
end
