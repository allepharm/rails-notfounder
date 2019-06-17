every "0 8 * * 1" do
  rake "logs:send_request_log"
end
