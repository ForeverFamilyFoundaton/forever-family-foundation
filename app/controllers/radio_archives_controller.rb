class RadioArchivesController < ApplicationController

  def index
    @archives = RadioArchive.all
  end
  
  def show
    archive = RadioArchive.find(params[:id])
    @cms_page = CmsPage.new
    @cms_page.title = archive.title
    @cms_page.sub_title = archive.guest
  end
  
end
