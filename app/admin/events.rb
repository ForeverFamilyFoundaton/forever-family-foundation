ActiveAdmin.register Event do
  config.sort_order = "start_time_desc"

  menu false

  index do
    column :id
    column :title do |q|
      if q.url.present?
        link_to q.title, q.url, target: '_blank'
      else
        q.title
      end
    end
    column :description do |q|
      truncate q.description, length: 200
    end
    column :start_time
    column :end_time
    column 'Actions' do |q|
      link_to 'Show', admin_event_path(q)
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :url
      f.input :pic_link
      f.input :description
      f.input :start_time
      f.input :end_time
      f.text_node "Your current time: " + Time.now.to_s + " " + Time.now.localtime.zone
    end
    f.actions
  end

  show do
    h1 do
      link_to event.title, event.url, target: '_blank'
    end
    h2 event.times
    div do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      raw markdown.render(event.description)
    end
  end

end
