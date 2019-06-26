class RailsNotFounder::RailsNotFounderGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  desc "This generator creates a RailsNotFounder initializer file at "\
       "config/initializers"
  def copy_initializer_file
    copy_file "initializer.rb", "config/initializers/rails_not_founder.rb"
  end
end
