require 'roo'
require 'spreadsheet'
class Reimporter
  def self.process(file)
    xls = Roo::Spreadsheet.open file
    i = 0
    errors = []
    user_attrs = []
    xls.each_with_pagename do |_, sheet|
      sheet.each(MAPPING) do |xl_attrs|
        next if xl_attrs[:id] == 'Id'

        user = User.find_by_email(xl_attrs[:email])

        if user
          if user.membership_number.blank?
            user.update_attribute :membership_number, xl_attrs[:id]
          end
        else
          membership_number = xl_attrs[:membership_number].present? ?
              xl_attrs[:membership_number].to_i :
              xl_attrs[:id].to_i

          user_attrs <<  {
            password: password = SecureRandom.hex(8),
            password_confirmation: password,
            membership_number: membership_number,
            first_name: xl_attrs[:first_name],
            middle_name: xl_attrs[:middle_name],
            middle_name: xl_attrs[:middle_name],
            last_name: xl_attrs[:last_name],
            email: xl_attrs[:email],
            cell_phone: xl_attrs[:cell_phone],
            home_phone: xl_attrs[:home_phone],
            work_phone: xl_attrs[:work_phone],
            work_phone: xl_attrs[:work_phone],
            fax: xl_attrs[:fax],
            is_business: xl_attrs[:is_business],
            address_attributes: {
              address: xl_attrs[:address_street],
              city: xl_attrs[:address_city],
              state: xl_attrs[:address_state],
              zip: xl_attrs[:address_zip],
              country: xl_attrs[:address_country],
            },
            enrolled_from: xl_attrs[:enrolled_from],
            do_not_mail: xl_attrs[:do_not_mail],
            problems: xl_attrs[:problems],
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
