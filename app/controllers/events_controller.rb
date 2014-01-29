class EventsController < ApplicationController

  def index
    @events = Event.all_upcoming
  end

  def show
    event = Event.find(params[:id])
    @cms_page = CmsPage.new
    @cms_page.title = event.title
    @cms_page.sub_title = event.times
    @cms_page.body = event.description
  end

end
