require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/email/rspec'
require 'webdrivers'
Webdrivers.cache_time = 86_400
Webdrivers::Chromedriver.required_version = '79.0.3945.36'

RSpec.configure do |config|
  config.before do |example|
    if example.metadata[:js]
      Capybara.current_driver = :selenium_chrome_headless
    elsif example.metadata[:chrome]
      Capybara.current_driver = :selenium_chrome
    end
  end

  def screenshot_filename(meta)
    "#{File.basename(meta[:file_path])}-#{meta[:line_number]}.png"
  end

  config.after do |example|
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

require 'support/database_cleaner'
