require 'spec_helper'

describe UserMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:user_params) {{first_name: 'John', last_name: 'Doe',
    email: 'user@example.com', password: 'testing'}}
  let(:template_params) {{title: '@first_name',
    body: 'z @last_name x @email', meta_keywords: 'welcome_email'}}

  context '#welcome_email' do
    before do
      @email = UserMailer.welcome_email(
        User.create!(user_params),
        EmailTemplate.create!(template_params)
      )
    end

    it {@email.should have_subject(/^John$/)}

    it {@email.should have_body_text('z Doe x user@example.com')}
  end
end
