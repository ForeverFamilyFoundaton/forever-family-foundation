module ApplicationHelper
  def fa_icon(icon, opts = {})
    content_tag :i, nil, class: ([:far, "fa-#{icon}"] << opts[:class]), data: opts[:data]
  end

  def setup_user(user)
    user.build_address if user.address.nil?
    user.family_members.build([{},{},{}]) if user.family_members.empty?
    user.family_members << FamilyMember.new if user.family_members.length == 1
    user.family_members << FamilyMember.new if user.family_members.length == 2
    user
  end

def setup_business(business)
    business.build_address if business.address.nil?
    business.build_billing_address if business.billing_address.nil?
    business.build_business_card(:kind => 'business_card') if business.business_card.nil?
    business.build_business_logo(:kind => 'business_logo') if business.business_logo.nil?
    business.build_web_banner(:kind => 'web_banner') if business.web_banner.nil?
    business.build_promotional_media_mp3(:kind => 'promotional_media_mp3') if business.promotional_media_mp3.nil?
    business.build_promotional_media_upload(:kind => 'promotional_media_upload') if business.promotional_media_upload.nil?
    business
  end

  def is_admin?
    current_user && (current_user.has_role?('admin') || current_user.has_role?('super_user'))
  end

  def blog(text)
    text = '' if text.nil?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    raw markdown.render(text)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_page
    case [@controller_name,@action_name].join('/')
    when /site\/index/ then :home
    when /radio/ then :radio
    when /events/ then :events
    when /store/ then :store
    when /volunteers/ then :volunteers
    when /contributions/ then :contributions
    end
  end
end
