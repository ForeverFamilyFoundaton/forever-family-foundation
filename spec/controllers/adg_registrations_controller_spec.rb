RSpec.describe AdgRegistrationsController do
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
      expect(response).to redirect_to '/users/sign_up'
    end
    it 'sets flash' do
      get :new
      expect(flash[:notice]).to eq I18n.t('flash.adg.user_required')
    end
  end

  context "on user being logged in" do
    before do
      sign_in @user
    end

    context "on get new" do
      it 'responds with success' do
        get :new
        expect(response).to be_successful
      end

      it 'renders new' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "on get new with adg questions" do
      setup do
        create(:user)
        create(:adg_question)
        create(:first_adg_question)
        create(:second_adg_question)
      end

      it 'responds with success' do
        get :new
        expect(response).to be_successful
      end

      it 'renders new' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context "on create adg registration" do
      before do
        @q1 = create(:adg_question)
        @q2 = create(:first_adg_question)
        @q3 = create(:second_adg_question)
        @p1 = create(:preference_adg)
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
        post :create, params: { :adg_registration => @params }
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
        post :create, params: { :adg_registration => @params }
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end

      it 'saves the adg preferences' do
        post :create, params: { :adg_registration => @params }
        expect(@user.adg_preferences).to eq [@p1]
      end
    end
  end
end
