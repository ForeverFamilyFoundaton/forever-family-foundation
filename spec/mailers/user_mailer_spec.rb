require 'rails_helper'

describe UserMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:user_params) {{first_name: 'John', last_name: 'Doe',
    email: 'user@example.com', password: 'testing', address_attributes: {address: '2342 hello st', city: 'sf', state: 'ca', zip: '94231'}}}
  let(:template_params) {{title: '@first_name',
    body: 'z @last_name x @email', reference_string: 'Email::Welcome'}}

  context '#welcome_email' do
    before do
      @email = UserMailer.welcome_email(
        User.create!(user_params),
        CmsPage.create!(template_params)
      )
    end

    it {@email.should have_subject(/^John$/)}

    it {@email.should have_body_text('z Doe x')}
  end
end
