class RailsNotFounder::RequestLogger
  def self.call(*args)
    new(*args).call
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call
    RailsNotFounder::Request.create!(
      headers: headers,
      method: request.request_method,
      ip: request.remote_ip,
      params: params.except(:action, :controller).permit!.to_h,
      url: request.url
    )
  end

  private

  attr_accessor :params, :request

  def headers
    request.headers.select do |header, _|
      header.starts_with?("HTTP")
    end
  end
end
