# JpAge

Calculate age under the Japanese law “([年齢計算ニ関スル法律](http://elaws.e-gov.go.jp/search/elawsSearch/elaws_search/lsg0500/detail?lawId=135AC0000000050&openerCode=1))”

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jp_age'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_age

## Usage

```ruby
jp_age = JpAge.new(Date.new(1988, 4, 1))
jp_age.age_as_of(Date.new(2018, 4, 1)) # => 30
jp_age.age_as_of(Date.new(2018, 3, 31)) # => 30
jp_age.age_as_of(Date.new(2018, 3, 30)) # => 29
jp_age.age_as_of(Time.new(2018, 3, 31, 23, 59, 59, '+09:00')) #=> 29
jp_age.age_as_of(Time.new(2018, 3, 31, 24, 0, 0, '+09:00')) #=> 30
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ymrl/jp_age. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the JpAge project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ymrl/jp_age/blob/master/CODE_OF_CONDUCT.md).
