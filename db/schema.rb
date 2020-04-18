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

ActiveRecord::Schema.define(version: 20200418000039) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "author", limit: 50
    t.string "title", limit: 25
    t.string "series_name", limit: 25
    t.integer "series_no"
    t.string "isbn_tab_no", limit: 20
    t.string "publisher", limit: 20
    t.date "published_date"
    t.string "location", limit: 20
    t.decimal "price", precision: 5, scale: 2
    t.date "purchase_date"
    t.date "entry_date"
    t.integer "condition_id", limit: 2
    t.integer "media_type_id", limit: 2
    t.integer "purpose_id", limit: 3
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "condition_id", limit: 2
    t.string "condition_name", limit: 10
  end

  create_table "media_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "media_type_id", limit: 2
    t.string "media_type_name", limit: 15
  end

  create_table "purposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "purpose_id", limit: 3
    t.string "purpose_type", limit: 15
    t.string "purpose_name", limit: 20
  end

end
