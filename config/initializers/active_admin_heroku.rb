if Rails.env.production?
  require 'fileutils'
  FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets", "admin"))

  template_path = "#{Gem.loaded_specs['activeadmin'].full_gem_path}/lib/active_admin/stylesheets"
  old_compile_path = "#{Rails.root}/public/stylesheets/admin"
  new_compile_path = "#{Rails.root}/tmp/stylesheets/admin"

  Sass::Plugin::remove_template_location template_path, old_compile_path
  Sass::Plugin::add_template_location template_path, new_compile_path
end