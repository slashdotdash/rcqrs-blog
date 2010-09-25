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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100923194622) do

  create_table "blog_reports", :force => true do |t|
    t.string   "guid",       :null => false
    t.string   "name",       :null => false
    t.string   "tagline",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_reports", ["guid"], :name => "index_blog_reports_on_guid"

  create_table "comment_reports", :force => true do |t|
    t.string   "guid"
    t.string   "post_id"
    t.string   "post_title"
    t.string   "author"
    t.string   "email"
    t.string   "website"
    t.text     "comment"
    t.datetime "approved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comment_reports", ["guid"], :name => "index_comment_reports_on_guid"
  add_index "comment_reports", ["post_id", "approved_at"], :name => "index_comment_reports_on_post_id_and_approved_at"
  add_index "comment_reports", ["post_id"], :name => "index_comment_reports_on_post_id"

  create_table "post_reports", :force => true do |t|
    t.string   "guid",                         :null => false
    t.string   "title",                        :null => false
    t.text     "raw_content",                  :null => false
    t.text     "html_content",                 :null => false
    t.integer  "comment_count", :default => 0, :null => false
    t.integer  "year",                         :null => false
    t.integer  "month",                        :null => false
    t.integer  "day",                          :null => false
    t.string   "slug",                         :null => false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_reports", ["guid"], :name => "index_post_reports_on_guid"
  add_index "post_reports", ["published_at"], :name => "index_post_reports_on_published_at"
  add_index "post_reports", ["year", "month", "day", "slug"], :name => "index_post_reports_on_year_and_month_and_day_and_slug"

end
