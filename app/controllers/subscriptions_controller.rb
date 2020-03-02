class SubscriptionsController < ApplicationController
  layout 'registration'

  def new
    @subscription = Subscription.new
  end

  def create
  end
end
