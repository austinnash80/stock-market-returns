# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_03_050207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "number_storages", force: :cascade do |t|
    t.integer "number_storage_one"
    t.integer "number_storage_two"
    t.integer "number_storage_three"
    t.integer "number_storage_four"
    t.integer "number_storage_five"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "realizeds", force: :cascade do |t|
    t.string "stock"
    t.string "symbol"
    t.date "acquired"
    t.date "sold"
    t.decimal "proceeds"
    t.decimal "cost"
    t.string "extra_s"
    t.date "extra_d"
    t.boolean "extra_b"
    t.integer "extra_i"
    t.decimal "extra_de"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "stock"
    t.string "symbol"
    t.date "first_sale"
    t.date "last_sale"
    t.integer "sales"
    t.decimal "proceeds"
    t.decimal "cost"
    t.decimal "return"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
