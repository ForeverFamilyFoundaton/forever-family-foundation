project_type = :rails
http_path    = '/'
css_dir      = 'tmp/stylesheets'
sass_dir     = 'app/assets/stylesheets'

require 'fileutils'
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/stylesheets'],
    :root => "#{Rails.root}/tmp")