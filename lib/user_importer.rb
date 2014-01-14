require 'csv'
require 'securerandom'
class UserImporter
  attr_accessor :errors
  def self.import
    @user_count, @family_member_count, @address_count = 0,0,0
    @errors = []
    CSV.foreach(Rails.root.join('users.csv'), headers: true) do |row|
      begin
        @email = val(row,'email').to_s
        @email = "member#{val(row,'Member #')}@invalidemail.com" unless @email.match(/\A[^@]+@[^@]+\z/)
        user = User.create!(
          membership_number: val(row,'Member #'),
          password: password = SecureRandom.hex(8),
          password_confirmation: password,
          email: @email,
          first_name: val(row,'First Name') || 'First Name',
          middle_name: val(row,'Middle'),
          last_name: val(row,'Last Name') || 'Last Name',
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
            @family_member_count += 1
          end
        end
        @address_count += 1 if user.create_address!(
          address: val(row,'Address 1').to_s + ' ' + val(row, 'Address 2').to_s,
          city: val(row,'City'),
          state: val(row,'Other State/Province'),
          zip: val(row,'Zip'),
          country: val(row,'Zip +4'),
        )
      rescue
        @errors << @email
      end
    end
    puts "Imported #{@user_count} users, #{@address_count} addresses, and #{@family_member_count} family members!"
    puts "========================="
    puts "Errors #{@errors.inspect}"
  end

  def self.val(row, key)
    row[keys.index(key)]
  end

  def self.keys
    ["email", "First Name", "Middle", "Last Name", "Phone - W", "Phone - H", "Address 1", "Address 2", "City", "State", "Other State/Province", "Country", "Zip +4", "Notes", "Date Enrolled", "Member #", "DO NOT MAIL", "Zip", "yes USA", "Phone - C", "fax", "Newsletter", "Active Role", "Corp Member", "Benefactor Info", "Memorial Cont", "Enrolled From", "problems", "Alt Address", "Family Mem1", "Relationship1", "email1", "Family Mem2", "Relationship 2", "Family Mem3", "Relationship3", "Family Mem4", "Relationship4"]
  end
end
