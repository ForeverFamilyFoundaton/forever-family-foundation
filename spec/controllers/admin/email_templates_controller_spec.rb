require 'spec_helper'

describe Admin::EmailTemplatesController do

  before { controller.stub(:authenticate_active_admin_user).and_return true }

  describe '#index' do
    it 'redirects to #new if no EmailTemplates exist' do
      get :index
      response.should redirect_to new_admin_email_template_path
    end

    it 'redirects to #show if EmailTemplate exists' do
      em = EmailTemplate.create! meta_keywords: 'welcome_email'
      get :index
      response.should redirect_to edit_admin_email_template_path em
    end
  end
end
