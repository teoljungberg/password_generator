class PasswordGenerator
  ASCII = "!".."~"
  LOWER = ASCII.grep(/[[:lower:]]/)
  UPPER = ASCII.grep(/[[:upper:]]/)
  DIGIT = ASCII.grep(/[[:digit:]]/)
  PUNCT = ASCII.grep(/[[:punct:]]/)
end
