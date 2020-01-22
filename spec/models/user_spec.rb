RSpec.describe User do
  let(:valid_params) {{first_name: 'John', last_name: 'Doe',
    email: 'user@example.com', password: 'testing'}}

  it { should have_one :address }
  it { should have_many :family_members }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :membership_number }
  it { should have_many :preferences }
  it { should have_many :profile_preferences }
  it { should have_many :subscription_preferences }
  it { should have_many :adg_preferences }
  it { should have_many(:categories).through(:user_categories) }

  it { should_not allow_mass_assignment_of :crypted_password }
  it { should_not allow_mass_assignment_of :password_salt }
  it { should_not allow_mass_assignment_of :single_access_token }
  it { should_not allow_mass_assignment_of :perishable_token }
  it { should_not allow_mass_assignment_of :login_count }
  it { should_not allow_mass_assignment_of :failed_login_count }
  it { should_not allow_mass_assignment_of :last_request_at }
  it { should_not allow_mass_assignment_of :current_login_at }
  it { should_not allow_mass_assignment_of :last_login_at }
  it { should_not allow_mass_assignment_of :current_login_ip }
  it { should_not allow_mass_assignment_of :last_login_ip }

  it 'increments a sequential id' do

  end

  context '#save' do
    let(:user) { User.new valid_params }

    before(:each) do
      user.build_address(address: '2342 hello st', city: 'sf', state: 'ca', zip: '94231')
    end

    it 'calls welcome_email' do
      expect(user).to receive(:welcome_message)
      user.save
    end

    it 'does not deliver mail if no template' do
      expect(UserMailer).not_to receive(:welcome_email)
      user.save
    end

    it 'attempts delivers mail if template available' do
      template = CmsPage.create!({
        title: '@first_name', body: 'z @last_name x @email', reference_string: 'Email::Welcome'
      })
      mail = UserMailer.welcome_email(user, template)
      allow(mail).to receive(:deliver)
      expect(UserMailer).to receive(:welcome_email).with(user, template).and_return mail
      user.save
    end
  end
  describe '#membership_number' do
    let!(:user) { create :user }
    let!(:user_2) { create :user }
    it 'auto increments' do
      expect(user_2.membership_number).to eq user.membership_number + 1
    end
  end
end
