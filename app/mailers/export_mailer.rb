class ExportMailer < ActionMailer::Base
  default from: "admin@foreverfamilyfoundation.com"

  def ready(export)
    @export = export
    mail(to: "director@foreverfamilyfoundation.com", subject: "Users export ready")
  end
end
