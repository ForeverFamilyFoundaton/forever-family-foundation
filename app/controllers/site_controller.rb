class SiteController < ApplicationController
  skip_before_filter :authenticate_admin_user!, :only => [:index]
  before_filter :get_events

  def page
  end
  def after_life_discussion_group; end
  def after_life_science; end
  def radio_archives; end
  def business_membership
    render :layout => 'popup'
  end
  def certified_mediums; end
  def contact; end
  def contributions; end
  def grief_and_loss; end
  def index; end
  def logged_in_index; end
  def signs_of_life_newsletter; end
  def signs_of_life_radio; end
  def store; end
  def store; end
  def support_and_information; end
  def volunteers; end
  def terms
    render :layout => 'popup'
  end

  def privacy
    render :layout => 'popup'
  end

private
  def get_events
    @events = Event.upcoming
  end
end
