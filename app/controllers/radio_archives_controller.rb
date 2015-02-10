class RadioArchivesController < ApplicationController

  def index
    @q = RadioArchive.ransack(params[:q]) 
    @archives = @q.result(distinct: true).page(params[:page] || 1).order('date desc')
  end

  def show
    archive = RadioArchive.find(params[:id])
    @cms_page = CmsPage.new
    @cms_page.title = archive.title
    @cms_page.sub_title = archive.guest
  end

end
