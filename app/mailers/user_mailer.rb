class UserMailer < ActionMailer::Base
  default from: "admin@foreverfamilyfoundation.com"
  default_url_options[:host]
  def welcome_email(user)
    @user = user
    # @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
