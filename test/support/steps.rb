def sign_in(user)
  visit login_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => 'password'
  click_on 'Sign in'
end

def sign_out(user)
  visit destroy_user_session_path
end

def pause
  puts 'pausing...'
  STDIN.gets
end

def fill_in_reg(params)
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
  click_on "Confirm"
end