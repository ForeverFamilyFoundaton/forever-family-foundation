class ExportMailer < ActionMailer::Base
  default from: "admin@foreverfamilyfoundation.com"

  def ready(export)
    @export = export
    mail(to: "4everfam@optonline.net", subject: "Users export ready")
  end
end
