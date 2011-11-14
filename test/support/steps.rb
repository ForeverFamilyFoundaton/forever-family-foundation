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
  fill_in "Email", :with => params[:email] 
  fill_in "Email confirmation", :with => params[:email]
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  fill_in "First name", :with => "Fname"
  fill_in "Last name", :with => "Lname"
  fill_in "Address", :with => "Street no. 100"
  fill_in "City", :with => "Los Angeles"
  fill_in "State", :with => "CA"
  fill_in "Zip", :with => "90001"
  check "Yes, I accept the Terms of Use"
  click_on "Register"
end

def fill_in_biz_reg(params={})
  fill_in "Name Of Business", with: "My Business"
  fill_in "Address", with: "Street No. 10"
  fill_in "City", with: "Los Angeles"
  fill_in "State", with: "CA"
  fill_in "Zip", with: "90001"
  fill_in "Contact Name", with: "My Self"
  fill_in "Contact Phone", with: "734876856"
  fill_in "Contact Email", with: "abc@example.com"
  fill_in "Contact Email Confirmation", with: "abc@example.com"
  fill_in "business_billing_address_attributes_address", with: "Street No. 10"
  fill_in "business_billing_address_attributes_city", with: "Los Angeles"
  fill_in "business_billing_address_attributes_state", with: "CA"
  fill_in "business_billing_address_attributes_zip", with: "90001"
end