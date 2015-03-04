class ExportMailer < ActionMailer::Base
  default from: "admin@foreverfamilyfoundation.com"

  def ready(export)
    @attachment_url = export.file.url

    mail(to: "4everfam@optonline.net", subject: "Users export ready")
  end
end
