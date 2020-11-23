require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/email/rspec'
require 'webdrivers'
Webdrivers.cache_time = 86_400
Webdrivers::Chromedriver.required_version ='87.0.4280.20'

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

  def capture_screenshot?(example)
    example.metadata[:type] == :feature &&
      example.exception.present? &&
      example.metadata[:chrome]
  end

  config.after do |example|
    # rubocop:disable Lint/Debugger
    if capture_screenshot?(example)
      save_and_open_screenshot screenshot_filename(example.metadata)
    end
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

require 'support/database_cleaner'
