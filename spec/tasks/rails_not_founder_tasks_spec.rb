require "rails_helper"

RSpec.describe "RailsNotFounder Tasks" do
  describe "logs:send weekly 404s report" do
    before do
      Rails.application.load_tasks
      Rake::Task.define_task(:environment)
      allow(RailsNotFounder::RequestLogSender).to receive_messages(call: spy)
    end

    it "calls RequestLogSender service" do
      Timecop.freeze(Time.zone.parse("2019-06-18 10:00")) do
        Rake::Task["logs:send_request_log"].invoke

        expect(RailsNotFounder::RequestLogSender)
          .to have_received(:call).with(Time.zone.parse("2019-06-11 10:00"))
      end
    end
  end
end
