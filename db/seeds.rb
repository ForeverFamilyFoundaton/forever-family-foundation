admin_email = 'admin@example.com'
password = 'password'
address = Address.create!(
  address: '123 Fake St.',
  city: 'Springfield',
  state: 'Karnataka',
  zip: '575001'
)
user = User.new(
  email: admin_email, 
  password: password, 
  password_confirmation: password, 
  first_name: 'Admin', 
  last_name: 'User',
  address: address
)
user.address = address
user.save!
user.roles << Role.find_by_name('admin')