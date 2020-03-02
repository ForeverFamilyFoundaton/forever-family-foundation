# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_01_192625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.integer "resource_id", null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "namespace", limit: 255
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"
  end

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "address", limit: 500
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "zip", limit: 255
    t.integer "addressable_id"
    t.string "addressable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "country", limit: 255
  end

  create_table "adg_answers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "adg_question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "answer", limit: 5000
    t.string "radio_val", limit: 255
    t.string "question", limit: 255
  end

  create_table "adg_questions", id: :serial, force: :cascade do |t|
    t.string "question", limit: 255
    t.boolean "show_radio", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 128, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "reset_password_sent_at"
    t.string "password_salt", limit: 255
    t.integer "failed_attempts", default: 0
    t.string "unlock_token", limit: 255
    t.datetime "locked_at"
    t.string "authentication_token", limit: 255
    t.string "invitation_token", limit: 255
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.string "body", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "start_date"
    t.date "end_date"
    t.text "link"
    t.string "button", limit: 255
  end

  create_table "attached_files", id: :serial, force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type", limit: 255
    t.string "attachment_file_name", limit: 255
    t.string "attachment_content_type", limit: 255
    t.string "attachment_file_size", limit: 255
    t.string "attachment_updated_at", limit: 255
    t.string "kind", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "image_data"
  end

  create_table "belief_type_selections", id: :serial, force: :cascade do |t|
    t.integer "belief_type_id"
    t.integer "sitterform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "belief_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "billing_addresses", id: :serial, force: :cascade do |t|
    t.string "address", limit: 255
    t.string "state", limit: 255
    t.string "country", limit: 255
    t.string "city", limit: 255
    t.string "zip", limit: 255
    t.integer "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_assignments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "contact_name", limit: 255
    t.string "contact_email", limit: 255
    t.string "contact_phone", limit: 255
    t.string "fax", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.text "promotional_info_additional_notes"
    t.boolean "use_business_card_for_web_banner"
    t.text "promotional_media_text"
    t.text "promotional_media_additional_notes"
    t.integer "completed_step", default: 0, null: false
    t.boolean "welcomed", default: false
    t.boolean "confirmed", default: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cms_images", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "caption"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "image_data"
  end

  create_table "cms_pages", id: :serial, force: :cascade do |t|
    t.string "reference_string", limit: 255
    t.string "title", limit: 255
    t.string "sub_title", limit: 255
    t.string "nav_text", limit: 255
    t.text "body"
    t.text "meta_keywords"
    t.text "meta_description"
    t.integer "position"
    t.integer "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "config_variables", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "embeded_links", id: :serial, force: :cascade do |t|
    t.text "body"
    t.string "title", limit: 255
    t.string "em_linkable_type", limit: 255
    t.integer "em_linkable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "url", limit: 255
    t.string "pic_link"
  end

  create_table "exports", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "file_file_name", limit: 255
    t.string "file_content_type", limit: 255
    t.integer "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "external_links", id: :serial, force: :cascade do |t|
    t.string "text", limit: 255
    t.string "url", limit: 255
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "linkable_type", limit: 255
    t.integer "linkable_id"
  end

  create_table "family_members", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "relationship", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "known_deads", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "relationship_id"
    t.integer "sitterform_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "year_of_death"
  end

  create_table "mediumform_preference_selections", id: :serial, force: :cascade do |t|
    t.integer "mediumform_id"
    t.integer "mediumform_preference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mediumform_preferences", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "preference_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mediumforms", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "personalprofessional"
    t.string "alt_first_name"
    t.string "alt_middle_name"
    t.string "alt_last_name"
    t.string "alt_work_phone"
    t.string "alt_mobile_phone"
    t.string "alt_address_line1"
    t.string "alt_address_line2"
    t.string "alt_city"
    t.string "alt_state"
    t.string "alt_zipcode"
    t.string "alt_country"
    t.string "alt_email"
    t.boolean "health_healing"
    t.text "other_businesses"
    t.string "website"
    t.string "blog"
    t.string "facebook"
    t.string "pinterest"
    t.string "instagram"
    t.string "twitter"
    t.string "youtube"
    t.string "other"
    t.text "other_primary_owner"
    t.text "other_related"
    t.text "other_not_related"
    t.text "became_aware"
    t.text "immediate_family"
    t.text "life_event"
    t.text "specific_goal"
    t.text "medium_priority"
    t.text "different_info"
    t.text "hear_about_fff"
    t.text "medium_history"
    t.text "kind_of_readings"
    t.text "self_classify"
    t.text "medium_preferences"
    t.text "other_classify"
    t.text "mediumship_training"
    t.text "ethics1"
    t.text "ethics2"
    t.text "ethics3"
    t.text "ethics4"
    t.string "sitter1"
    t.string "sitter2"
    t.string "sitter3"
    t.string "sitter4"
    t.string "sitter5"
    t.string "medium_status"
    t.string "test_date"
    t.string "application_date"
    t.boolean "signature_checkbox", default: false
    t.string "signature"
    t.text "other_certification"
    t.datetime "MEPC_Removed"
    t.datetime "MEPC_Failed"
    t.text "admin_notes"
    t.string "SitterA"
    t.string "SitterB"
    t.string "SitterC"
    t.string "SitterD"
    t.string "SitterE"
    t.string "alt_home_phone"
    t.string "alt_work_email"
    t.string "alt_home_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "preference_type", limit: 255
  end

  create_table "radio_archives", id: :serial, force: :cascade do |t|
    t.string "format", limit: 255
    t.date "date"
    t.string "title", limit: 255
    t.string "guest", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_book_categories", id: :serial, force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_book_groups", id: :serial, force: :cascade do |t|
    t.integer "recommended_book_id"
    t.integer "recommended_book_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_books", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "amazon_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uk_amazon_link"
    t.string "cad_amazon_link"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "typeof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "sitterforms", id: :serial, force: :cascade do |t|
    t.string "phone"
    t.string "cell"
    t.string "alt_email"
    t.text "website"
    t.text "facebook"
    t.text "pinterest"
    t.text "instagram"
    t.text "twitter"
    t.text "youtube"
    t.text "blog"
    t.text "related_contact_info"
    t.boolean "been_to_medium"
    t.boolean "lost_loved_one"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "relationships"
    t.integer "belief_type_id"
    t.text "medium_contacts"
    t.boolean "signature_checkbox", default: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "stripe_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_categories", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_user_categories_on_category_id"
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "user_preference_selections", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "preference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "encrypted_password", limit: 128, default: "", null: false
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token", limit: 255
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name", limit: 255
    t.string "middle_name", limit: 255
    t.string "last_name", limit: 255
    t.string "cell_phone", limit: 255
    t.string "home_phone", limit: 255
    t.string "work_phone", limit: 255
    t.string "state", limit: 255
    t.boolean "is_business", default: false
    t.string "fax", limit: 255
    t.string "enrolled_from", limit: 255
    t.integer "welcomed", default: 0, null: false
    t.boolean "confirmed", default: false
    t.datetime "reset_password_sent_at"
    t.string "password_salt", limit: 255
    t.integer "failed_attempts", default: 0
    t.string "unlock_token", limit: 255
    t.datetime "locked_at"
    t.string "authentication_token", limit: 255
    t.string "invitation_token", limit: 255
    t.string "email", limit: 255
    t.boolean "do_not_mail"
    t.integer "membership_number"
    t.text "problems"
    t.datetime "enrolled_at"
    t.boolean "snail_mail", default: false, null: false
    t.boolean "sitter_registration", default: false
    t.boolean "medium_registration", default: false
    t.datetime "discarded_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
