class UserNotifier
  def self.send_adg_email(user)
    adg_template = CmsPage.where(reference_string: 'Email::Adg').first
    UserMailer.adg_email(user, adg_template).deliver_later if adg_template
  end
end
