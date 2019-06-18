require "rails_not_founder/engine"
require "rails_not_founder/configuration"

module RailsNotFounder
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
