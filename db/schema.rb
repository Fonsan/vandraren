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

ActiveRecord::Schema.define(:version => 20100821224745) do

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.date     "date"
    t.integer  "competition_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "competitions", ["date"], :name => "index_competitions_on_date"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "klasses", :force => true do |t|
    t.string   "short_name"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "main_class", :default => false, :null => false
  end

  add_index "klasses", ["short_name"], :name => "index_klasses_on_short_name"

  create_table "people", :force => true do |t|
    t.date     "birthdate"
    t.string   "name"
    t.string   "surname"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["birthdate"], :name => "index_people_on_birthdate"

  create_table "results", :force => true do |t|
    t.integer  "competition_id"
    t.integer  "person_id"
    t.integer  "position"
    t.string   "time"
    t.string   "time_diff"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
