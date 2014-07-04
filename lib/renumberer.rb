require 'roo'
require 'spreadsheet'
class Renumberer
  def self.process
    count = 0
    User.where(membership_number: nil).each do |u|
      count += 1
      u.update_attribute :membership_number, User.maximum(:membership_number) + 1
    end
    puts count
  end
end
