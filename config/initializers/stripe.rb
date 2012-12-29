if Rails.env.production?
  Stripe.api_key = ENV['STRIPE_API_KEY']
else
  Stripe.api_key = 'gw7kQHtJJFEieaR61IlHUjBMddK6x5CE'
end
