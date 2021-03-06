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

ActiveRecord::Schema.define(:version => 20100204124750) do

  create_table "r_settings", :force => true do |t|
    t.string   "key",                         :null => false
    t.text     "value"
    t.string   "data_type"
    t.string   "description", :limit => 1000
    t.integer  "object_id"
    t.string   "object_type", :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "r_settings", ["object_type", "object_id", "key"], :name => "index_r_settings_on_object_type_and_object_id_and_key", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
