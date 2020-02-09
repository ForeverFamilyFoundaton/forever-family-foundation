schedule_file = Rails.root.join('config/schedule.yml')

if File.exist?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

if Rails.env.development?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!
end
