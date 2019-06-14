require "rails_helper"

RSpec.describe RailsNotFounder::RequestsController, type: :request do
  describe "ANY (method) :create" do
    it "handles GET request" do
      get "/unmatched"

      expect(response).to have_http_status(:not_found)
    end

    it "handles POST request" do
      post "/test", params: { test: "test" }

      expect(response).to have_http_status(:not_found)
    end
  end
end
