class RailsNotFounder::Configuration
  attr_accessor :sender_email, :receiver_email

  def initialize
    @sender_email = "404_report@example.com"
    @receiver_email = "admin@example.com"
  end
end
