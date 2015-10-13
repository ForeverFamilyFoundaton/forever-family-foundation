module AnnouncementsHelper
  def announcement_hidden?(announcement)
      cookies["announcement_#{announcement.created_at}"] == "hidden"
  end

  def current_announcement
    return @current_announcement if defined? @current_announcement
    @current_announcement = Announcement.current
  end

  def no_announcement
      current_announcement.nil? or announcement_hidden?(current_announcement)
  end
end