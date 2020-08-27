module RailsNotFounder
  class RequestsController < ApplicationController
    skip_forgery_protection raise: false

    def create
      RailsNotFounder::RequestLogger.call(params, request)
      raise_not_found
    end

    private

    def raise_not_found
      render(
        file: Rails.root.join("public", "404.html"),
        status: 404,
        layout: false,
      )
    end
  end
end
