# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_211503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "provinces", force: :cascade do |t|
    t.integer "pruid"
    t.string "prname"
    t.string "prnameFR"
    t.date "date"
    t.integer "numconf"
    t.integer "numprob"
    t.integer "numdeaths"
    t.integer "numtotal"
    t.integer "numtested"
    t.integer "numrecover"
    t.decimal "percentrecover", precision: 6, scale: 2
    t.integer "ratetested"
    t.integer "numtoday"
    t.decimal "percentoday", precision: 6, scale: 2
    t.decimal "ratetotal", precision: 6, scale: 2
    t.decimal "ratedeaths", precision: 4, scale: 2
    t.integer "deathstoday"
    t.decimal "percentdeath", precision: 6, scale: 2
    t.integer "testedtoday"
    t.integer "recoveredtoday"
    t.decimal "percentactive", precision: 6, scale: 2
    t.integer "numactive"
    t.decimal "rateactive", precision: 6, scale: 2
    t.integer "numtotal_last14"
    t.decimal "ratetotal_last14", precision: 6, scale: 2
    t.integer "numdeaths_last14"
    t.decimal "ratedeaths_last14", precision: 4, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pruid", "prname", "prnameFR"], name: "index_provinces_on_pruid_and_prname_and_prnameFR"
  end

  create_table "website_settings", force: :cascade do |t|
    t.datetime "last_fetch"
    t.boolean "success"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
