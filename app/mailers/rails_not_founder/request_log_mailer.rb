module RailsNotFounder
  class RequestLogMailer < ApplicationMailer
    layout false
    default from: RailsNotFounder.configuration.sender_email,
            to: RailsNotFounder.configuration.receiver_email

    def notify(log, subject)
      @log = log
      @subject = subject
      mail(subject: subject)
    end
  end
end
