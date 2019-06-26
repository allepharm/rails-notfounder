class RailsNotFounder::Request < ApplicationRecord
  scope :for_request_log, ForRequestLogScope
end
