require "rails_helper"

RSpec.describe RailsNotFounder::RequestLogSender do
  describe ".call" do
    subject { described_class }

    it { should forward_to_instance(:call).with_1_arg }
  end

  describe "#call" do
    let(:service) { described_class.new(date_from) }
    let(:date_from) { Time.zone.parse("2019-04-16 10:00") }
    let(:request_log_mailer) { instance_double(ActionMailer::MessageDelivery) }

    before do
      allow(RailsNotFounder::Request)
        .to receive(:for_request_log)
        .with(date_from)
        .and_return(:request_log)
      allow(RailsNotFounder::RequestLogMailer)
        .to receive_messages(notify: request_log_mailer)
      allow(request_log_mailer).to receive(:deliver_now)
    end

    it "creates a mailer" do
      service.call

      expect(RailsNotFounder::RequestLogMailer)
        .to have_received(:notify)
        .with(:request_log, "Weekly 404s report")
    end

    it "sends a weekly 404s report" do
      service.call

      expect(request_log_mailer).to have_received(:deliver_now)
    end
  end
end
