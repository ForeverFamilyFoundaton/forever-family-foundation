require 'rails_helper'

describe AdgRegistrationsController do
  setup_user

  before do
    CmsPage.where({title: '@first_name', body: 'z @last_name x @email', reference_string: 'Email::Adg'}).first_or_create
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  context "on user being not logged in" do
    it  'redirects to singup' do
      get :new
      response.should redirect_to '/users/sign_up'
    end
    it 'sets flash' do
      get :new
      flash[:notice].should == I18n.t('flash.adg.user_required')
    end
  end

  context "on user being logged in" do
    before do
      sign_in @user
    end

    context "on get new" do
      it 'responds with success' do
        get :new
        response.should be_success
      end

      it 'renders new' do
        get :new
        response.should render_template(:new)
      end
    end

    context "on get new with adg questions" do
      setup do
        FactoryGirl.create(:user)
        FactoryGirl.create(:adg_question)
        FactoryGirl.create(:first_adg_question)
        FactoryGirl.create(:second_adg_question)
      end

      it 'responds with success' do
        get :new
        response.should be_success
      end

      it 'renders new' do
        get :new
        response.should render_template(:new)
      end
    end

    context "on create adg registration" do
      before do
        @q1 = FactoryGirl.create(:adg_question)
        @q2 = FactoryGirl.create(:first_adg_question)
        @q3 = FactoryGirl.create(:second_adg_question)
        @p1 = FactoryGirl.create(:preference_adg)
        @params = {
          :answer => {
            @q1.id => 'answer1',
            @q2.id => 'answer2'
          },
          :radio_val => {
            @q1.id => 'yes',
            @q2.id => 'no'
          },
          :adg_preference_ids => [ @p1.id ]
        }
      end

      it 'saves the adg answers' do
        post :create, :adg_registration => @params
        @user.adg_answers.each do |adg_answer|
          expect(
            @params[:answer][adg_answer.adg_question_id]
          ).to eq adg_answer.answer
          expect(
            @params[:radio_val][adg_answer.adg_question_id]
          ).to eq adg_answer.radio_val
        end
      end

      it "emails the user" do
        post :create, :adg_registration => @params
        expect(ActionMailer::Base.deliveries.count).to eq(1) 
      end

      it 'saves the adg preferences' do
        post :create, :adg_registration => @params
        @user.adg_preferences.should == [@p1]
      end
    end
  end
end
