class RailsNotFounder::MissingController < ApplicationController
  def create
    raise_not_found
  end

  private

  def raise_not_found
    render file: Rails.root.join("public", "404.html"),
           status: 404,
           layout: false
  end
end
