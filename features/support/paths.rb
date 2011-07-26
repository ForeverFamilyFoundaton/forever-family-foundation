module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when /the user registration page/
      new_account_path
    when /the login page/
      new_user_session_path
    when /the account confirmation page/
      user_confirm_path
    when /the failed login page/    
      user_session_path
    when /failed registration page/
      account_path
    when /logged in page/
      url_for(:controller => 'welcome', :action => 'logged_in_index', :only_path => true)
    when /admin section/
      admin_cms_pages_path
    when /forgot password page/
      new_password_reset_path
    when /the ADG registration page/
      new_adg_registration_path
    when /the business registration page as user "([^\"]*)"/
      user = User.find_by_email($1)      
      new_user_business_path(user)
    when /the business registration step 2 page as user "([^\"]*)" and business as "([^\"]*)"/
      user = User.find_by_email($1)
      business = Business.find_by_name($2)
      edit_user_business_path(user, business, :step => '2')
    when /the business registration step 3 page as user "([^\"]*)" and business as "([^\"]*)"/
      user = User.find_by_email($1)
      business = Business.find_by_name($2)
      edit_user_business_path(user, business, :step => '3')
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
