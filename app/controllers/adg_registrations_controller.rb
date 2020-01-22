class AdgRegistrationsController < ApplicationController
  before_action :require_registration, :only => [:new]

  def new
    session[:adg_registration] = nil
    @adg_questions = AdgQuestion.all
  end

  def create
    adg_answers = params[:adg_registration][:answer]
    adg_radio_val_hash = params[:adg_registration][:radio_val] || {}
    adg_answers.each_pair do |question_id, answer|
      adg_question = AdgQuestion.find(question_id)
      adg_answer = current_user.adg_answers.find_or_create_by(adg_question_id: adg_question.id)
      adg_answer.answer = answer
      adg_answer.radio_val = adg_radio_val_hash[question_id]
      adg_answer.question = adg_question.question
      adg_answer.save!
    end
    current_user.update_attribute(:adg_preference_ids, params[:adg_registration][:adg_preference_ids])
    UserNotifier.send_adg_email(current_user)

    flash[:notice] = I18n.t('flash.adg.answers_updated')
    redirect_to current_user
  end

  private

  def require_registration
    if current_user.blank?
      session[:adg_registration] = true
      flash[:notice] = I18n.t('flash.adg.user_required')
      redirect_to new_user_registration_path
    end
  end
end

