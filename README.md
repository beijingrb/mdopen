# Mdopen

`mdopen` is a command tool to preview your Markdown file.

I ever thought to write such a tool to preview `README` file in a git repository when working in terminal. And then I find [mdopen](https://github.com/romanyx/mdopen) written in Golang before I start. Now I migrate it to Ruby.

Hope it helpful~

## Installation

`mdopen` is mainly a command tool, you can just install it as:

    $ gem install mdopen

## Usage

    $ mdopen [markdown_file]

`README` or `README.md` will be used in turn as an input filename if the [markdown_file] is omitted or not exists. So run `mdopen` when you only want to view the `README` file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mdopen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mdopen project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mdopen/blob/master/CODE_OF_CONDUCT.md).
