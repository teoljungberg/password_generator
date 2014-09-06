class PasswordGenerator
  ASCII = "!".."~"
  LOWER = ASCII.grep(/[[:lower:]]/)
  UPPER = ASCII.grep(/[[:upper:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  def self.generate length: 50, digit: 0
    password = (LOWER + UPPER).sample length
    password << DIGIT.sample(digit)
    password
      .flatten
      .shuffle
      .join
  end
end
