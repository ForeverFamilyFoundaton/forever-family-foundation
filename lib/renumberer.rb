require 'roo'
require 'spreadsheet'
class Renumberer
  def self.process(file)
    xls = Roo::Spreadsheet.open file
    i = 0
    errors = []
    user_attrs = []
    xls.each_with_pagename do |_, sheet|
      sheet.each(MAPPING) do |attrs|
        user = User.find_by_email attrs[:email]
        if user
          membership_number = attrs[:membership_number].blank? ? attrs[:id] : attrs[:membership_number]
          puts "Setting #{membership_number.to_i}"
          user.update_attribute :membership_number, membership_number.to_i
        end
      end
    end
  end
    MAPPING = {
    id: 'Id',
    membership_number:  'Membership number',
    email: 'Email',
  }
end
