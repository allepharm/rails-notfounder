require "rails_helper"

RSpec.describe RailsNotFounder::Request::ForRequestLogScope do
  describe ".call" do
    subject { described_class }

    it { should forward_to_instance(:call).with_1_arg }
  end

  describe "#call" do
    let(:scope) { described_class.new(date_from) }
    let(:date_from) { Time.zone.parse("2019-04-16 16:00") }
    let(:sql) { scope.call.to_sql }

    it "generates valid SQL" do
      expect { scope.call.load }.not_to raise_error
    end

    it "generates expected SQL" do
      expect(sql.squish).to include(<<-SQL.squish), sql
        SELECT 'url' AS url, COUNT(*) AS count FROM
        "rails_not_founder_requests" WHERE
        (created_at >= '2019-04-16 16:00:00') GROUP BY
        "rails_not_founder_requests"."url" ORDER BY count DESC
      SQL
    end

    it "generates pretty SQL" do
      expect(sql).not_to include "\n"
    end
  end
end
