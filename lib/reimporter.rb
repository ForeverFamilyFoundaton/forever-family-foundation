require 'roo'
require 'spreadsheet'
class Reimporter

  xls = Roo::Spreadsheet.open('./new_prices.xls')
  xls.each(
    membership_number:  'Membership number',
    first_name:  'First name',
    middle_name:  'Middle name',
    last_name: 'Last name',
    email: 'Email'
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
  ) {|hash| puts hash[:first_name] }
end
