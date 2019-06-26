class RailsNotFounder::RequestLogSender
  def self.call(*args)
    new(*args).call
  end

  def initialize(date_from)
    self.date_from = date_from
  end

  def call
    RailsNotFounder::RequestLogMailer
      .notify(request_log, "Weekly 404s report")
      .deliver_now
  end

  private

  attr_accessor :date_from

  def request_log
    RailsNotFounder::Request.for_request_log(date_from)
  end
end
