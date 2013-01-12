ActiveAdmin.register EmailTemplate do

  menu false

  actions :update, :edit, :create, :new, :show

  config.clear_action_items!

  form partial: 'form'

  collection_action :index, method: :get do
    if email_template = EmailTemplate.where(meta_keywords: 'welcome_email').first
      redirect_to edit_admin_email_template_path email_template
    else
      redirect_to new_admin_email_template_path
    end
  end

  show do
    h1 email_template.title
    div do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      raw markdown.render(email_template.body)
    end
    columns do
      column do
        link_to 'Edit Email Template', edit_admin_email_template_path(params)
      end
    end
  end
end
