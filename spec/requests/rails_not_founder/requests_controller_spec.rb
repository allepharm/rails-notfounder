require "rails_helper"

RSpec.describe RailsNotFounder::RequestsController, type: :request do
  describe "ANY (method) :create" do
    before do
      allow(RailsNotFounder::RequestLogger).to receive_messages(call: :request)
    end

    it "handles GET request" do
      get "/unmatched"

      expect(response).to have_http_status(:not_found)
    end

    it "handles POST request" do
      post "/test", params: { test: "test" }

      expect(response).to have_http_status(:not_found)
    end

    it "calls RequestLogger service" do
      get "/weird/222"

      expect(RailsNotFounder::RequestLogger).to have_received(:call)
    end
  end
end
