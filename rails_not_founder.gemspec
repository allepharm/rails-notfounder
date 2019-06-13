$:.push File.expand_path("lib", __dir__)

require "rails_not_founder/version"

Gem::Specification.new do |s|
  s.name        = "rails_not_founder"
  s.version     = RailsNotFounder::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "https://github.com/allepharm/rails-notfounder"
  s.summary     = "Aggregate 404s in a separate model and email weekly reports"\
                  " with 404s per domain request"
  s.license     = "MIT"

  s.files = Dir[
    "{app,config,db,lib}/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md"
  ]

  s.add_dependency "rails", "~> 5.2.3"

  s.add_development_dependency "pg"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-rspec"
end
