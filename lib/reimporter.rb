require 'roo'
require 'spreadsheet'
class Reimporter
  def self.process(file)
    xls = Roo::Spreadsheet.open file
    i = 0
    errors = []
    user_attrs = []
    xls.each_with_pagename do |_, sheet|
      sheet.each(MAPPING) do |attrs|
        next if attrs[:id] == 'Id' || User.exists?(email: attrs[:email])
        user_attrs <<  {
          password: password = SecureRandom.hex(8),
          password_confirmation: password,
          membership_number: (attrs[:membership_number] || attrs[:id]).to_i,
          first_name: attrs[:first_name],
          middle_name: attrs[:middle_name],
          middle_name: attrs[:middle_name],
          last_name: attrs[:last_name],
          email: attrs[:email],
          cell_phone: attrs[:cell_phone],
          home_phone: attrs[:home_phone],
          work_phone: attrs[:work_phone],
          work_phone: attrs[:work_phone],
          fax: attrs[:fax],
          is_business: attrs[:is_business],
          address_attributes: {
            address: attrs[:address_street],
            city: attrs[:address_city],
            state: attrs[:address_state],
            zip: attrs[:address_zip],
            country: attrs[:address_country],
          },
          enrolled_from: attrs[:enrolled_from],
          do_not_mail: attrs[:do_not_mail],
          problems: attrs[:problems],
        }
      end
    end
    ActiveRecord::Base.transaction do
      user_attrs.each do |u_attrs|
        begin
          puts 'Creating ...'
          u = User.new
          u.assign_attributes(u_attrs)
          u.save!
        rescue => e
          puts 'Fail...'
          puts u_attrs.inspect
          puts e.message
          errors << { u_attrs[:email] => e.message }
        end
      end
    end
    puts errors.inspect
  end
  MAPPING = {
    id: 'Id',
    membership_number:  'Membership number',
    first_name:  'First name',
    middle_name:  'Middle name',
    last_name: 'Last name',
    email: 'Email',
    cell_phone: 'Cell phone',
    home_phone: 'Home phone',
    work_phone:  'Work phone',
    fax: 'Fax',
    is_business: 'Is business',
    address_street: 'Address: street',
    address_city: 'Address: city',
    address_state: 'Address: state',
    address_zip:  'Address: zip',
    address_country:  'Address: country',
    enrolled_from:  'Enrolled from',
    enrolled_at: 'Enrolled at',
    do_not_mail: 'Do not mail',
    problems: 'Problems'
  }
end
