ActiveAdmin.register ExternalLink do
  index do
    column :text
    column :url
    column "Actions" do |q|
      link_to "Delete", admin_link_path(q, method: :delete)
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :text
      f.input :url
    end
    f.buttons
  end

  show do
    h1 do
      link_to external_link.text, external_link.url, target: '_blank'
    end
  end

end
