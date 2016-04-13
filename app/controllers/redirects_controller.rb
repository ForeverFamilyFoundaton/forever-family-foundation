class RedirectsController < ApplicationController
  def home_page
      redirect_to :root, :status => :moved_permanently
  end
  def certified_mediums
    redirect_to '/site/certified_mediums', :status => :moved_permanently
  end
  def suicide
    redirect_to :root, :status => :moved_permanently
  end
  def contributions
    redirect_to '/site/contributions', :status => :moved_permanently
  end
  def signs_of_life_radio
    redirect_to '/site/signs_of_life_radio', :status => :moved_permanently
  end
  def events
    redirect_to :events, :status => :moved_permanently
  end
end
