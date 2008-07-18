# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "attachments", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.string   "tags"
    t.string   "description"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.references "page"
  end

  create_table "revisions", :force => true do |t|
    t.integer  "page_id"
    t.string "mime"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end 

  create_table "metas", :force => true do |t|
    t.integer "page_id"
    t.string "name"
    t.string "value"
  end
  
  create_table "pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "title",                    :null => false
    t.integer  "position"
    t.integer  "depth",      :limit => 5
    t.string   "state",      :limit => 12
    t.string "mime", :limit => 12
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
