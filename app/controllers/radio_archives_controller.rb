class RadioArchivesController < ApplicationController
  def index
    @q = RadioArchive.ransack(params[:q])
    @archives = @q.result(distinct: true).page(params[:page] || 1).order('date desc')
  end

  def show
    archive = RadioArchive.find(params[:id])
    @cms_page = CmsPage.new(
      title: archive.title,
      sub_title: archive.sub_title
    )
  end

  private
  def record_not_found(e)
    redirect_to radio_archives_path, notice: e.message
  end

end
