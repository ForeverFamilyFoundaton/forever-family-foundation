require_relative '../test_helper'

class AdgRegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  context "on user being not logged in" do
    setup do
      get :new
    end
    should redirect_to '/users/sign_up'
    should set_the_flash.to(I18n.t('flash.adg.user_required'))
  end

  context "on user being logged in" do
    setup do
      sign_in Factory.create(:user)
    end

    context "on get new" do
      setup do
        get :new
      end
      should respond_with :success
      should render_template :new
    end

    context "on get new with adg questions" do
      setup do
        Factory.create(:user)
        Factory.create(:adg_question)
        Factory.create(:first_adg_question)
        Factory.create(:second_adg_question)
        get :new
      end
      should respond_with :success
      should render_template :new
    end

    context "on create adg registration" do
      setup do
        @user = Factory.create(:user)
        sign_in @user
        @q1 = Factory.create(:adg_question)
        @q2 = Factory.create(:first_adg_question)
        @q3 = Factory.create(:second_adg_question)
        @p1 = Factory.create(:preference_adg)
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
        post :create, :adg_registration => @params
      end

      should 'save the adg answers' do
        @user.adg_answers.each do |adg_answer|
          assert_equal @params[:answer][adg_answer.adg_question_id], adg_answer.answer
          assert_equal @params[:radio_val][adg_answer.adg_question_id], adg_answer.radio_val
        end
      end

      should 'save the adg preferences' do
        assert_equal @user.adg_preferences, [@p1]
      end

      should redirect_to("the adg page") {
        user_path(@user)
      }
    end
  end
end
