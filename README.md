# PasswordGenerator

Generate passwords based on certain options:

- length
- digits
- punctuation characters

Inspired by [Tim Pope's](https://github.com/tpope) Play-by-play over at
[Pluralsihgt](http://www.pluralsight.com/training/Courses/TableOfContents/play-by-play-tim-pope)

## Usage

If you want a password with that is 30 characters:

```ruby
>> PasswordGenerator.new(length: 30).generate
=> "kpaeqdzNOHZToUtXcjLPDWmMSyfIrb"
```

With 6 digits:

```ruby
>> PasswordGenerator.new(digit: 6).generate
=> "wfVcnsG1ypDaRCYjTKeNFJHmorg07QWvkPAhXLzBUOxit8udS5IMEbl3"
```

With 5 punctuation chars:

```ruby
>> PasswordGenerator.new(punct: 5).generate
=> "dcZD,IiFGMmyql&CpnA(LbhNa]tRzXrUjE_SefTuvwWgsHVxYPJkoOQ"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/password_generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
