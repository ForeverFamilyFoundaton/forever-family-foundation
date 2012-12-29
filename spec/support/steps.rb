def sign_in(user)
  visit login_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => 'password'
  click_button 'Login'
end

def sign_out(user)
  visit destroy_user_session_path
end

def pause
  puts 'pausing...'
  STDIN.gets
end

def fill_in_reg(params={})
  params[:email] ||= 'abc@example.com'
  fill_in "user_email", :with => params[:email]
  fill_in "user_email_confirmation", :with => params[:email]
  fill_in "user_password", :with => "password"
  fill_in "user_password_confirmation", :with => "password"
  fill_in "user_first_name", :with => "Fname"
  fill_in "user_last_name", :with => "Lname"
  fill_in "Address", :with => "Street no. 100"
  fill_in "City", :with => "Los Angeles"
  fill_in "State", :with => "CA"
  fill_in "Zip", :with => "90001"
  check "Yes, I accept the Terms of Use"
  click_on "Register"
end

def fill_in_biz_reg(params={})
  within '.biz_address' do
    fill_in "Name Of Business", with: "My Business"
    fill_in "Address", with: "Street No. 10"
    fill_in "City", with: "Los Angeles"
    fill_in "State", with: "CA"
    fill_in "Zip", with: "90001"
    fill_in "Contact Name", with: "My Self"
    fill_in "Contact Phone", with: "734876856"
    fill_in "business_contact_email", with: "abc@example.com"
    fill_in "business_contact_email_confirmation", with: "abc@example.com"
  end
  within '.billing_address' do
    fill_in "business_billing_address_attributes_address", with: "Street No. 10"
    fill_in "business_billing_address_attributes_city", with: "Los Angeles"
    fill_in "business_billing_address_attributes_state", with: "CA"
    fill_in "business_billing_address_attributes_zip", with: "90001"
  end
end

def fill_in_payment_details
  fill_in "credit_card_name", with: "John Doe"
  fill_in "credit_card_number", with: "4242424242424242"
  fill_in "credit_card_cvc", with: "123"
  page.select('2', :from => 'credit_card_exp_month')
  page.select(2.years.from_now.year, :from => 'credit_card_exp_year')
end
