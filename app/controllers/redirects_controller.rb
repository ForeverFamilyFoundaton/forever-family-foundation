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
  def recommended_books
    redirect_to :recommended_book_index, :status => :moved_permanently
  end
  def guest_house_brochure
    redirect_to "http://s3.amazonaws.com/fff_attached_files/attached_files/attachments/000/000/433/original/TheGuestHouse-brochure.pdf?2014", :status => :moved_permanently
  end
  def sitemap
    redirect_to "http://s3.amazonaws.com/fff_attached_files/attached_files/attachments/000/000/671/original/sitemap_forever.xml?2016" #, :status => :moved_permanently
  end
end
