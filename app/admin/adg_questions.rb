ActiveAdmin.register AdgQuestion do
  menu false
  index do
    column :question
    column :show_radio
    column "Actions" do |q|
      link_to "Delete", admin_adg_question_path(q, method: :delete)
    end
  end

end
