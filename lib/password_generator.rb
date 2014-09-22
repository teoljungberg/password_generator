class PasswordGenerator
  ASCII = "!".."~"
  ALPHA = ASCII.grep(/[[:alpha:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  attr_reader :alphas, :digits, :puncts, :length

  def initialize length: 50, digit: 0, punct: 0
    @alphas = ALPHA.sample length
    @digits = DIGIT.sample digit
    @puncts = PUNCT.sample punct
    @length = length
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
