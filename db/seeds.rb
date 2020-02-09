AdminUser.create! email: 'admin@example.com', password: 'password'
User.create!(
  email: 'user@example.com',
  password: 'password',
  first_name: 'John',
  last_name: 'Doe',
  address_attributes: {
    address: '123 Fake St.', city: 'New York', state: 'NY', zip: '10013'
  }
)
CmsPage.create! reference_string: 'Site: Index', title: 'First page'
AdgQuestion.create! question: 'Have you lost someone close to you?'
