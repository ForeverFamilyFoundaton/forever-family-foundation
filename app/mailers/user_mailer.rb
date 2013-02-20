class UserMailer < ActionMailer::Base
  default from: "admin@foreverfamilyfoundation.com"

  def welcome_email(user, welcome_email)
    @user = user
    # @url  = "http://example.com/login"
    body = welcome_email.body
    subject = welcome_email.subject
    user.attributes.keys.each do |key|
      body.gsub!("@#{key.to_s}", user[key].to_s)
      subject.gsub!("@#{key.to_s}", user[key].to_s)
    end
    mail(:to => user.email, subject: subject, body: body) do |format|
      format.html
      format.text
    end
  end
end
