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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150706162905) do

  create_table "arguments", force: true do |t|
    t.text     "titolo"
    t.text     "descrizione"
    t.integer  "interessati"
    t.string   "tipologia"
    t.string   "stato"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "arguments", ["professor_id"], name: "index_arguments_on_professor_id"

  create_table "professors", force: true do |t|
    t.string   "nome"
    t.string   "cognome"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "ufficio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "nome"
    t.string   "cognome"
    t.string   "email"
    t.string   "matricola"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
