class CmsImage < ActiveRecord::Base

  paperclip_opts = { styles: { thumb: '100x100>' }}
  if Rails.env.production?
    paperclip_opts.merge(S3_STORAGE_OPTS).merge(bucket: 'fff_cms_images')
  end
  has_attached_file :image, {
    styles: { thumb: '100x100>' }
  }.merge(paperclip_opts)
end
