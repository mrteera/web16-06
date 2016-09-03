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

ActiveRecord::Schema.define(version: 20160903072754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allquotations", force: :cascade do |t|
    t.string   "quote"
    t.string   "author"
    t.integer  "categories_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["categories_id"], name: "index_allquotations_on_categories_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotation_dbs", force: :cascade do |t|
    t.string   "quote"
    t.string   "author"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.string   "quote"
    t.string   "author"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allquotations", "categories", column: "categories_id"
end
