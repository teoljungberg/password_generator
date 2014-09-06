class PasswordGenerator
  ASCII = "!".."~"
  LOWER = ASCII.grep(/[[:lower:]]/)
  UPPER = ASCII.grep(/[[:upper:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)

  def self.generate length: 50
    (LOWER + UPPER)
      .sample(length)
      .shuffle
      .join
  end
end
