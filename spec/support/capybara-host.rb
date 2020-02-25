# Port matches Capybara settings is test.rb
# config.action_mailer.default_url_options = { host: 'localhost',
#                                              port: 3001 }
Capybara.configure do |config|
  config.server_port  = 3001
  config.app_host     = 'http://localhost:3001'
end
