RSpec.feature 'Sitter registration' do
  before do
    @user = FactoryBot.create(:user, { email: 'abc@example.com', password: 'password'})
    @user2 = FactoryBot.create(:user, { email: 'qwe@example.com', password: 'password', sitter_registration: true})
  end

  it 'Sitterform login with no sitter_registration flag', :sitterform do
    visit '/login'
    sign_in(@user)
    visit '/login'
    expect(page).to_not have_content 'Sitter Registration'
  end

  it 'Sitterform login with sitter_registration flag', :sitterform do
    visit '/login'
    sign_in(@user2)
    visit '/login'
    expect(page).to have_content 'Sitter Registration'
  end

  it 'Sitterform form shows', :sitterform do
    visit '/login'
    sign_in(@user2)
    visit '/login'
    click_link('Sitter Registration Form')
    expect(page).to have_content 'CONDITIONS AND TERMS OF PARTICIPATION AS A SITTER IN THE PROGRAM'
  end

  it 'Sitterform signature_checkbox need to be checked', :sitterform do
    visit '/login'
    sign_in(@user2)
    visit '/login'
    click_link('Sitter Registration Form')
    fill_in('Electronic Signature', :with => 'John Doe')
    click_button('Submit')
    expect(page).to have_content 'Signature checkbox needs to be checked'
  end

  # it 'Sitterform signature and signature_checkbox', :driver => :webkit, type: :sitterform do
  #   visit '/login'
  #   sign_in(@user2)
  #   visit '/'
  #   click_link('Sitter Registration Form')
  #   #choose('sitterform_belief_type_id_1', visible: false)
  #   page.execute_script("document.getElementById('sitterform_belief_type_id_1').ch‌​ecked = true")
  #   fill_in('Electronic Signature', :with => 'John Doe')
  #   page.check("sig_check_box")
  #   #find(:css, "#sig_check_box").set(true)
  #   click_button('Submit')

  #   expect(page).to have_content 'Sitterform was successfully'
  # end


  # it 'biz reg' do
  #   visit '/users/login'
  #   fill_in "user_email", :with => 'asd@example.com'
  #   fill_in "user_email_confirmation", :with => 'asd@example.com'
  #   fill_in "user_password", :with => "password"
  #   fill_in "user_password_confirmation", :with => "password"
  #   fill_in "user_first_name", :with => "Fname"
  #   fill_in "user_last_name", :with => "Lname"
  #   fill_in "Address", :with => "Street no. 100"
  #   fill_in "City", :with => "Los Angeles"
  #   fill_in "State", :with => "CA"
  #   fill_in "Zip", :with => "90001"
  #   check "Yes, I accept the Terms of Use"
  #   check "I am registering a business"
  #   click_on "Register"
  #   expect(current_url).to match "/users/#{User.last.id}/businesses/new"
  # end

  # it 'confirms email case insensitive' do
  #   visit '/users/sign_up'
  #   fill_in_reg(email: 'CASE@sensative.com', email_confirmation: 'CASE@sensative.com', password: '')
  #   expect(find_field('user_email').value).to eq 'case@sensative.com'
  #   expect(find_field('user_email_confirmation').value).to eq 'case@sensative.com'
  # end

end
