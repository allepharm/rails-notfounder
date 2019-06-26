namespace :logs do
  desc "send weekly 404s report"
  task send_request_log: :environment do
    RailsNotFounder::RequestLogSender.call(7.days.ago)
  end
end
