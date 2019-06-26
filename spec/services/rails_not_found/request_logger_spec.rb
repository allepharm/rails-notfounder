require "rails_helper"

RSpec.describe RailsNotFounder::RequestLogger do
  describe ".call" do
    subject { described_class }

    it { should forward_to_instance(:call).with_2_args }
  end

  describe "#call" do
    let(:service) { described_class.new(params, request) }

    let(:params) do
      ActionController::Parameters.new(
        "controller" => "requests",
        "action" => "create",
        "unmatched_route" => "test"
      )
    end

    let(:request) do
      instance_double(
        ActionDispatch::Request,
        request_method: "GET",
        url: "http://example.com/test",
        remote_ip: "127.0.0.1",
        headers: [
          %w[HTTPS off],
          %w[HTTP_HOST www.example.com],
          %w[PATH_INFO /test],
          ["HTTP_COOKIE", ""]
        ]
      )
    end

    before do
      allow(RailsNotFounder::Request).to receive_messages(create!: :request)
    end

    it "saves a request to an unmatched route" do
      service.call

      expect(RailsNotFounder::Request)
        .to have_received(:create!)
        .with(
          headers: [
            %w[HTTPS off],
            %w[HTTP_HOST www.example.com],
            ["HTTP_COOKIE", ""]
          ],
          method: "GET",
          ip: "127.0.0.1",
          params: { "unmatched_route" => "test" },
          url: "http://example.com/test"
        )
    end
  end
end
