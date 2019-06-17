class RailsNotFounder::RequestLogMailer < ApplicationMailer
  layout false
  default from: "404s Log <404s_log@example.com>",
          to: "404s Log <404s_log@example.com>"

  def notify(log, subject)
    @log = log
    @subject = subject
    mail(subject: subject)
  end
end
