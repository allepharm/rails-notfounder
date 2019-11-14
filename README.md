# RailsNotFounder
Aggregate 404s in a separate model and email weekly reports with 404s per domain
request.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_not_founder'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_not_founder
```

## Configuration

Run the generator `rails g rails_not_founder` to create a gem initializer:

```ruby
RailsNotFounder.configure do |config|
  config.sender_email = "404_report@example.com"
  config.receiver_email = "admin@example.com"
end
```

And adjust the emails used for sending and receiving a weekly 404 report.

Copy the migrations from the engine and run migrations:

```ruby
rake rails_not_founder:install:migrations
rake db:migrate
```

Add catch all route at the end of your routes:

```ruby
mount RailsNotFounder::Engine => "/"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
