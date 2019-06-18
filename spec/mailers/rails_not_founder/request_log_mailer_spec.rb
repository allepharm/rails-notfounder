require "rails_helper"

RSpec.describe RailsNotFounder::RequestLogMailer, type: :mailer do
  describe "notify" do
    let(:mail) { described_class.notify(log, mail_subject) }
    let(:mail_subject) { "Weekly 404s report" }

    # rubocop:disable RSpec/VerifiedDoubles
    let(:log) do
      [
        double(url: "https://example.com/unmatched", count: 2),
        double(url: "https://example.com/test", count: 1)
      ]
    end
    # rubocop:enable RSpec/VerifiedDoubles

    it "renders the subject" do
      expect(mail.subject).to eq "Weekly 404s report"
    end

    it "renders the 'from email'" do
      expect(mail.from).to eq %w[404_report@example.com]
    end

    it "renders the 'to email'" do
      expect(mail.to).to eq %w[admin@example.com]
    end

    it "renders a url and a number of occurrences of the most popular 404" do
      expect(mail.body.encoded).to match(
        %r{2 - https://example.com/unmatched}
      )
    end

    it "renders a url and a number of occurrences of the second most popular 404" do
      expect(mail.body.encoded).to match(
        %r{1 - https://example.com/test}
      )
    end
  end
end
