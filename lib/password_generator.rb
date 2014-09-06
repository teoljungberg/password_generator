class PasswordGenerator
  ASCII = "!".."~"
  LOWER = ASCII.grep(/[[:lower:]]/)
  UPPER = ASCII.grep(/[[:upper:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  attr_reader :alphas, :length, :digits, :puncts

  def initialize length: 50, digit: 0, punct: 0
    @alphas = (LOWER + UPPER).sample length
    @digits = DIGIT.sample digit
    @puncts = PUNCT.sample punct
  end

  def generate
    password = alphas
    password << digits
    password << puncts
    password
      .flatten
      .shuffle
      .join
  end
end
