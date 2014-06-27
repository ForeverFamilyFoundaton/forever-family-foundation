#lib/tasks/import.rake
desc "Imports a CSV file into an ActiveRecord table"
task :reimport => :environment do
  require 'reimporter'
  Reimporter.process('user_list.xls')
end
desc "Update the User#membership_number"
task :renumber => :environment do
  require 'renumberer'
  Renumberer.process('user_list.xls')
end
