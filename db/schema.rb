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

ActiveRecord::Schema.define(version: 20200526040900) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "author", limit: 50, null: false
    t.string "title", limit: 25, null: false
    t.string "series_name", limit: 25
    t.integer "series_no", limit: 3, unsigned: true
    t.string "isbn_tab_no", limit: 20, null: false
    t.string "publisher", limit: 20, null: false
    t.date "published_date"
    t.string "location", limit: 20, null: false
    t.float "price", limit: 24
    t.date "purchase_date"
    t.date "entry_date"
    t.integer "condition_id", limit: 1, null: false, unsigned: true
    t.integer "media_type_id", limit: 1, null: false, unsigned: true
    t.integer "purpose_id", limit: 2, null: false, unsigned: true
    t.integer "book_type_id", limit: 1, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booktypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "book_type_idx", limit: 1, null: false, unsigned: true
    t.string "book_type_name", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_type_idx"], name: "index_booktypes_on_book_type_idx", unique: true
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "condition_idx", limit: 1, null: false, unsigned: true
    t.string "condition_name", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_idx"], name: "index_conditions_on_condition_idx", unique: true
  end

  create_table "mediatypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "media_type_idx", limit: 1, null: false, unsigned: true
    t.string "media_type_name", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type_idx"], name: "index_mediatypes_on_media_type_idx", unique: true
  end

  create_table "purposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "purpose_idx", limit: 3, null: false, unsigned: true
    t.string "purpose_type", limit: 15, null: false
    t.string "purpose_name", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purpose_idx"], name: "index_purposes_on_purpose_idx", unique: true
  end

end
