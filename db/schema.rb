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

ActiveRecord::Schema.define(version: 20140703151634) do

  create_table "paniers", force: true do |t|
    t.float    "coute"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.integer  "week_id"
  end

  create_table "paniers_recipes", id: false, force: true do |t|
    t.integer "panier_id"
    t.integer "recipe_id"
  end

  add_index "paniers_recipes", ["panier_id", "recipe_id"], name: "index_paniers_recipes_on_panier_id_and_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_desc"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "weeks", force: true do |t|
    t.date     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
