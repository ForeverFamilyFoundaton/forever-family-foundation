require 'spec_helper'

describe 'EmailTemplate Form' do
  it 'auto suggests' do
    sign_in_as_admin
    click_on 'Email Templates'
    page.execute_script('$("#email_template_title").focus();')
    fill_in 'email_template_title', with: 'asdfdf @fir'
    page.should have_selector '.ui-autocomplete', visible: true
    subject_text = find('#email_template_title')
    subject_text.native.send_keys :tab
    page.evaluate_script('$("#email_template_title").val();').should eq 'asdfdf @first_name'
  end
end
