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

ActiveRecord::Schema.define(version: 20180511175036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "ideascomments", force: :cascade do |t|
    t.text "body"
    t.bigint "idea_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idea_id"], name: "index_ideascomments_on_idea_id"
    t.index ["user_id"], name: "index_ideascomments_on_user_id"
  end

  create_table "scraps", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scraps_on_user_id"
  end

  create_table "scrapscomments", force: :cascade do |t|
    t.text "body"
    t.bigint "scrap_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scrap_id"], name: "index_scrapscomments_on_scrap_id"
    t.index ["user_id"], name: "index_scrapscomments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ideas", "users"
  add_foreign_key "ideascomments", "ideas"
  add_foreign_key "ideascomments", "users"
  add_foreign_key "scraps", "users"
  add_foreign_key "scrapscomments", "scraps"
  add_foreign_key "scrapscomments", "users"
end
