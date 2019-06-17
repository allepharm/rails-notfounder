source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gemspec

group :development, :test do
  gem "powerpack", require: "powerpack/string/format"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-rspec"
end

group :test do
  gem "shoulda-matchers"
end
