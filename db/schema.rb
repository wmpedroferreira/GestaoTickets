# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120109150722) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.string   "ticket_id"
    t.string   "subject"
    t.string   "message"
    t.string   "close_ticket"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["ticket_id", "created_at"], :name => "index_logs_on_ticket_id_and_created_at"

  create_table "messages", :force => true do |t|
    t.integer  "author_id"
    t.integer  "deliver_id"
    t.string   "subject"
    t.text     "body"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "client_id"
    t.string   "admin_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "user_id"
    t.string   "project_id"
    t.string   "state_id"
    t.string   "urgency_id"
    t.string   "intervention_id"
    t.string   "request_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["user_id", "created_at"], :name => "index_tickets_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "img_file_path"
    t.string   "tipo_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
