# In test and development, external service calls are stubbed with the WebMock
# library. The WebMock stubs must be loaded before any HTTPClient instances
# are initialized
if %w(test development).include?(Rails.env)
  require 'webmock'
  include WebMock::API
  # Allow localhost (Capybara) calls
  # WebMock.disable_net_connect! allow_localhost: true
  # stub_request(:any, "translate.google.com")
  # stub_request(:any, "js.stripe.com")
end
