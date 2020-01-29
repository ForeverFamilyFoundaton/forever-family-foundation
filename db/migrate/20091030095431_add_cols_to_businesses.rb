class AddColsToBusinesses < ActiveRecord::Migration[4.2]
  def self.up
    add_column :businesses, :business_card_file_name, :string
    add_column :businesses, :business_card_content_type, :string
    add_column :businesses, :business_card_file_size, :string
    add_column :businesses, :business_card_updated_at, :string

    add_column :businesses, :business_logo_file_name, :string
    add_column :businesses, :business_logo_content_type, :string
    add_column :businesses, :business_logo_file_size, :string
    add_column :businesses, :business_logo_updated_at, :string

    add_column :businesses, :web_banner_file_name, :string
    add_column :businesses, :web_banner_content_type, :string
    add_column :businesses, :web_banner_file_size, :string
    add_column :businesses, :web_banner_updated_at, :string

    add_column :businesses, :promotional_info_additional_notes, :text
    add_column :businesses, :use_business_card_for_web_banner, :boolean

    add_column :businesses, :promotional_media_mp3_file_name, :string
    add_column :businesses, :promotional_media_mp3_content_type, :string
    add_column :businesses, :promotional_media_mp3_file_size, :string
    add_column :businesses, :promotional_media_mp3_updated_at, :string

    add_column :businesses, :promotional_media_upload_file_name, :string
    add_column :businesses, :promotional_media_upload_content_type, :string
    add_column :businesses, :promotional_media_upload_file_size, :string
    add_column :businesses, :promotional_media_upload_updated_at, :string

    add_column :businesses, :promotional_media_text, :text
    add_column :businesses, :promotional_media_additional_notes, :text
  end

  def self.down
    remove_column :businesses, :business_card_file_name
    remove_column :businesses, :business_card_content_type
    remove_column :businesses, :business_card_file_size
    remove_column :businesses, :business_card_updated_at

    remove_column :businesses, :business_logo_file_name
    remove_column :businesses, :business_logo_content_type
    remove_column :businesses, :business_logo_file_size
    remove_column :businesses, :business_logo_updated_at

    remove_column :businesses, :web_banner_file_name
    remove_column :businesses, :web_banner_content_type
    remove_column :businesses, :web_banner_file_size
    remove_column :businesses, :web_banner_updated_at

    remove_column :businesses, :promotional_info_additional_notes
    remove_column :businesses, :use_business_card_for_web_banner

    remove_column :businesses, :promotional_media_mp3_file_name
    remove_column :businesses, :promotional_media_mp3_content_type
    remove_column :businesses, :promotional_media_mp3_file_size
    remove_column :businesses, :promotional_media_mp3_updated_at

    remove_column :businesses, :promotional_media_upload_file_name
    remove_column :businesses, :promotional_media_upload_content_type
    remove_column :businesses, :promotional_media_upload_file_size
    remove_column :businesses, :promotional_media_upload_updated_at

    remove_column :businesses, :promotional_media_text
    remove_column :businesses, :promotional_media_additional_notes
  end
end
