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

ActiveRecord::Schema.define(version: 20140710182128) do

  create_table "paniers", force: true do |t|
    t.date     "semaine"
    t.float    "coute"
    t.integer  "user_id"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paniers_recipes", id: false, force: true do |t|
    t.integer "panier_id",             null: false
    t.integer "recipe_id",             null: false
    t.integer "size",      default: 2, null: false
  end

  add_index "paniers_recipes", ["panier_id", "recipe_id"], name: "index_paniers_recipes_on_panier_id_and_recipe_id"

  create_table "products", force: true do |t|
    t.string   "name",                       null: false
    t.boolean  "par_kilo",   default: true,  null: false
    t.float    "price",                      null: false
    t.boolean  "available",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_recipes", id: false, force: true do |t|
    t.integer "product_id", null: false
    t.integer "recipe_id",  null: false
    t.float   "quantity",   null: false
  end

  add_index "products_recipes", ["product_id", "recipe_id"], name: "index_products_recipes_on_product_id_and_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "title",        null: false
    t.text     "short_desc"
    t.text     "instructions", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.boolean  "admin",               default: false, null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "weeks", force: true do |t|
    t.date     "start",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
