# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100605045939) do

  create_table "albums", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], :name => "albums_user_id_fk"

  create_table "contents", :force => true do |t|
    t.integer  "media_id",    :null => false
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["media_id"], :name => "contents_media_id_fk"

  create_table "medias", :force => true do |t|
    t.integer  "album_id",    :null => false
    t.string   "title",       :null => false
    t.string   "type",        :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medias", ["album_id"], :name => "medias_album_id_fk"

  create_table "tags", :force => true do |t|
    t.integer  "content_id", :null => false
    t.string   "category",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["content_id"], :name => "tags_content_id_fk"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "username",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "albums", "users", :name => "albums_user_id_fk", :dependent => :delete

  add_foreign_key "contents", "medias", :name => "contents_media_id_fk", :dependent => :delete

  add_foreign_key "medias", "albums", :name => "medias_album_id_fk", :dependent => :delete

  add_foreign_key "tags", "contents", :name => "tags_content_id_fk", :dependent => :delete

end
