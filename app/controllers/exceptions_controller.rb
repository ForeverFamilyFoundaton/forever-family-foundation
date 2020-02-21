class ExceptionsController < ApplicationController
  def not_found
    @cms_page = CmsPage.new title: 'Page not found (404)'
    render status: 404
  end

  def internal_error
    @cms_page = CmsPage.new title: 'Internal server error (500)'
    render status: 500
  end

  def unacceptable
    @cms_page = CmsPage.new title: "Sorry, we couldn't do that (422)"
    render status: 422
  end
end
