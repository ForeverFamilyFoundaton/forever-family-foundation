def sign_in(user)
  visit login_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => 'password'
  click_on 'Sign in'
end

def pause
  puts 'pausing...'
  STDIN.gets
end