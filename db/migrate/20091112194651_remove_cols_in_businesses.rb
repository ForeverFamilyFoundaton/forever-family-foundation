class RemoveColsInBusinesses < ActiveRecord::Migration[4.2]
  def self.up
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

    remove_column :businesses, :promotional_media_mp3_file_name
    remove_column :businesses, :promotional_media_mp3_content_type
    remove_column :businesses, :promotional_media_mp3_file_size
    remove_column :businesses, :promotional_media_mp3_updated_at

    remove_column :businesses, :promotional_media_upload_file_name
    remove_column :businesses, :promotional_media_upload_content_type
    remove_column :businesses, :promotional_media_upload_file_size
    remove_column :businesses, :promotional_media_upload_updated_at
  end

  def self.down
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

    add_column :businesses, :promotional_media_mp3_file_name, :string
    add_column :businesses, :promotional_media_mp3_content_type, :string
    add_column :businesses, :promotional_media_mp3_file_size, :string
    add_column :businesses, :promotional_media_mp3_updated_at, :string

    add_column :businesses, :promotional_media_upload_file_name, :string
    add_column :businesses, :promotional_media_upload_content_type, :string
    add_column :businesses, :promotional_media_upload_file_size, :string
    add_column :businesses, :promotional_media_upload_updated_at, :string
  end
end
