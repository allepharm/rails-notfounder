require "rails_helper"

RSpec.describe RailsNotFounder::Configuration do
  let(:configuration) { described_class.new }

  describe "#sender_email" do
    it "sets default sender_email" do
      configuration.sender_email = "404_report@example.com"
    end
  end

  describe "#receiver_email" do
    it "sets default receiver_email" do
      configuration.receiver_email = "admin@example.com"
    end
  end
end
