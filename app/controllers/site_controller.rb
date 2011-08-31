class SiteController < ApplicationController
  skip_before_filter :authenticate_admin_user!, :only => [:index]
  before_filter :get_events
  
  def index; end
  def logged_in_index; end
  def after_life_discussion_group; end
  def certifed_mediums; end
  def signs_of_life_newsletter; end
  def signs_of_life_radio; end        
  def after_life_science; end
  def grief_and_loss; end
  def support_and_information; end
  def store; end  
  def contributers; end    
  def volunteers; end      

private
  def get_events
    @events = Event.upcoming
  end
end
