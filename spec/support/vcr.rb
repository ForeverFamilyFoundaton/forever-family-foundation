driver_hosts = Webdrivers::Common.subclasses.map { |driver| URI(driver.base_url).host }

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.ignore_hosts(*driver_hosts)
end
