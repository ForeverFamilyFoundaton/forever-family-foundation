include WebMock::API

WebMock.disable_net_connect!(allow_localhost: true)

WebMock.stub_request(
  :post,
  "https://api.stripe.com/v1/charges"
).to_return(
  :status => 200, body: '{}'
)

WebMock.stub_request(
  :any,
  'https://js.stripe.com/v1/'
).to_return(
  body: File.new(Rails.root + 'spec/support/stripe.js').read
)
