require 'csv'
require 'securerandom'
class UserImporter
  attr_accessor :errors
  def self.import
    @user_count, @family_member_count, @address_count = 0,0,0
    CSV.foreach(Rails.root.join('users.csv')) do |row|
      user = User.create!(
        # id: val(row,'Member #'),
        password: password = SecureRandom.hex(8),
        password_confirmation: password,
        email: val(row,'email'),
        first_name: val(row,'First Name'),
        middle_name: val(row,'Middle'),
        last_name: val(row,'Last Name'),
        cell_phone: val(row,'Phone - C'),
        home_phone: val(row,'Phone - H'),
        work_phone: val(row,'Phone - W'),
        is_business: val(row,'Corp Member') == 'YES',
        fax: val(row,'fax'),
        enrolled_from: val(row,'Enrolled From'),
      )
      @user_count += 1
      (1..3).each do |i|
        if val(row,"Family Mem#{i}")
          name_parts = val(row,"Family Mem#{i}").split
          user.family_members.create!(
            fist_name: name_parts.pop,
            last_name: name_parts,
            relationship: val(row,"Relationship#{i}"),
          )
          @family_member_count =+ 1
        end
      end
      @address_count += 1 if user.address.create!(
        address: val(row,'Address 1') + ' ' + val(row, 'Address 2'),
        city: val(row,'City'),
        state: val(row,'Other State/Province'),
        zip: val(row,'Zip'),
        country: val(row,'Zip +4'),
      )
    end
    puts "Imported #{@user_count} users, #{@address_count} addresses, and #{@family_member_count} family members!"
  end

  def self.val(row, key)
    row[keys.index(key)]
  end

  def self.keys
    ["email", "First Name", "Middle", "Last Name", "Phone - W", "Phone - H", "Address 1", "Address 2", "City", "State", "Other State/Province", "Country", "Zip +4", "Notes", "Date Enrolled", "Member #", "DO NOT MAIL", "Zip", "yes USA", "Phone - C", "fax", "Newsletter", "Active Role", "Corp Member", "Benefactor Info", "Memorial Cont", "Enrolled From", "problems", "Alt Address", "Family Mem1", "Relationship1", "email1", "Family Mem2", "Relationship 2", "Family Mem3", "Relationship3", "Family Mem4", "Relationship4"]
  end
end
