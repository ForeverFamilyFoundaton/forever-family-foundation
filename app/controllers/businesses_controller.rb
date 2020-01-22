class BusinessesController < ApplicationController
  before_action :continue_registration, only: [:new]

  def new
    params[:step] ||= 1
    @business = current_user.business || Business.new
  end

  def create
    @business = current_user.build_business(params[:business])
    if @business.save
      @business.complete_step!(1)
      flash[:notice] = I18n.t('flash.business.create.success', step: 1)
      redirect_to user_business_payment_path(current_user, @business)
    else
      render :new
    end
  end

  def payment
    @user = current_user
    @business = @user.business
    if request.post?
      begin
        Stripe::Charge.create(
          amount: (ConfigVariable.find_by_name('Price').try(:value) || 100).to_i * 100,
          currency: "usd",
          card: {
            number: params[:credit_card][:number],
            exp_month: params[:credit_card][:exp_month],
            exp_year: params[:credit_card][:exp_year],
            cvc: params[:credit_card][:cvc],
            name: params[:credit_card][:name]
          },
          description: "Forever Family Foundation business membership"
        )
        flash[:notice] = I18n.t('flash.business.payment.success')
        redirect_to user_business_register_path(current_user, @business, step: 3)
      rescue Stripe::CardError, Stripe::InvalidRequestError  => e

        # Since it's a decline, Stripe::CardError will be caught
        body = e.json_body
        @business.errors.add(:base, body[:error][:message])
        render :payment
        # puts "Status is: #{e.http_status}"
        # puts "Type is: #{err['type']}"
        # puts "Code is: #{err['code']}"
        # param is '' in this case
        # puts "Param is: #{err['param']}"
        # puts "Message is: #{err['message']}"
      # rescue Stripe::AuthenticationError => e
      #   # Authentication with Stripe's API failed
      #   # (maybe you changed API keys recently)
      # rescue Stripe::APIConnectionError => e
      #   # Network communication with Stripe failed
      # rescue Stripe::StripeError => e
        # Display a very generic error to the user, and maybe send
        # yourself an email
      end
    else
      render :payment
    end
  end

  def register
    next_step = params[:step].to_i + 1  #   session[:step] + 1

    @user = current_user
    @business = current_user.business

    if request.put? && @business.update_attributes(params[:business])
      @business.complete_step!(params[:step])
      flash[:notice] = I18n.t('flash.business.create.success', step: params[:step])

      redirect_to user_path(@user) and return if @business.reg_complete?

      redirect_to user_business_register_path(
        current_user, current_user.business,
      step: next_step )
    else
      render :register
    end
  end

  def edit
    @business = current_user.business
  end

  def update
    @business = current_user.business
    if @business.update_attributes(params[:business])
      flash[:notice] = I18n.t('flash.business.update.success')
      redirect_to user_path(current_user)
    else
      render template: "businesses/edit"
    end

  end

  def attachment
    attached_file = current_user.business.attached_files.find(params[:attachment_id])
    send_file attached_file.attachment.path, :type => attached_file.attachment.content_type
  end

  private

  def continue_registration
    if !params[:step].nil?
      if params[:step]==2
        render :payment
      else
        redirect_to user_business_register_path(
          current_user, current_user.business,
        step: params[:step])
      end
    end
  end
end
