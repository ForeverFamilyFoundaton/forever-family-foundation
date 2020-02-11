require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ForeverFamilyFoundation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_record.belongs_to_required_by_default = false
    config.active_job.queue_adapter = :sidekiq
    config.time_zone = 'UTC'
    config.i18n.default_locale = :en
    config.generators do |g|
      g.test_framework :rspec, views: false
      g.helper false
      g.assets false
      g.helper_specs false
      g.view_specs false
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
