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

ActiveRecord::Schema[7.0].define(version: 2023_12_04_004838) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.string "token", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["developer_id"], name: "index_api_tokens_on_developer_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_developers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true
  end

  create_table "topups", force: :cascade do |t|
    t.decimal "amount"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_topups_on_phone_number", unique: true
    t.index ["user_id"], name: "index_topups_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "deposit"
    t.decimal "withdrawal"
    t.string "currency"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_tokens", "developers"
  add_foreign_key "topups", "users"
  add_foreign_key "transactions", "users"
end
