class RedirectsController < ApplicationController
  def certifiedmediums
    redirect_to :events, :status => :moved_permanently
  end
    def hello
    redirect_to :root, :status => :moved_permanently
  end
end