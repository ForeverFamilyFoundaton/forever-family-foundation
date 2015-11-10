stub_request(:post, "https://api.stripe.com/v1/charges").to_return(:status => 200, body: '{}')
