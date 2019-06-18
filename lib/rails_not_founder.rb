require "rails_not_founder/engine"
require "rails_not_founder/configuration"

module RailsNotFounder
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
    alias config configuration
  end
end
