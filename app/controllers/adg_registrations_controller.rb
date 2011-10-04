class AdgRegistrationsController < ApplicationController
  before_filter :redirect_to_reg_if_no_user, :only => [:new]

  def new
    @adg_questions = AdgQuestion.all
    @adg_answers = current_user.adg_answers.all.map do |answer|
      {
        adg_question_id: answer.adg_question_id,
        answer: answer.answer,
        radi_val: answer.radio_val
      }
    end
  end

  def create
    adg_answers = params[:adg_registration][:answer]
    adg_radio_val_hash = params[:adg_registration][:radio_val] || {}
    adg_answers.each_pair do |question_id, answer|
      adg_question = AdgQuestion.find(question_id)
      adg_answer = current_user.adg_answers.find_or_create_by_adg_question_id(adg_question.id)
      adg_answer.answer = answer
      adg_answer.radio_val = adg_radio_val_hash[question_id]
      adg_answer.question = adg_question.question
      adg_answer.save!
    end
    current_user.update_attribute(:adg_preference_ids, params[:adg_registration][:adg_preference_ids])
    flash[:notice] = I18n.t('flash.adg.answers_updated')
    redirect_to new_adg_registration_path
  end

  private

  def redirect_to_reg_if_no_user
    if current_user.blank?
      flash[:notice] = I18n.t('flash.adg.user_required')
      store_location_adg_registration
      redirect_to new_account_path
    end
  end
end

