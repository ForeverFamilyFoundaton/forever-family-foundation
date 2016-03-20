class RecommendedBookController < ApplicationController
  def show
    archive = RecommendedBook.find(params[:id])
    @cms_page = CmsPage.new
    @cms_page.title = archive.title
    @cms_page.sub_title = archive.guest
  end

  def index
    @q = RecommendedBook.ransack(params[:q]) 
    @recc_books = @q.result(distinct: true).page(params[:page] || 1).order('title asc')
  end
end
