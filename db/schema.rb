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

ActiveRecord::Schema[7.2].define(version: 2024_10_08_180759) do
  create_table "expenses", force: :cascade do |t|
    t.string "from_account"
    t.string "from_account_name"
    t.string "to_account"
    t.string "to_account_name"
    t.date "execution_date"
    t.date "expense_date"
    t.decimal "amount"
    t.string "currency"
    t.string "transaction_type"
    t.text "communication"
    t.text "details"
    t.string "status"
    t.string "reason_refused"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_recurring_expenses", force: :cascade do |t|
    t.integer "recurring_expense_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_recurring_expenses_on_person_id"
    t.index ["recurring_expense_id"], name: "index_person_recurring_expenses_on_recurring_expense_id"
  end

  create_table "recurring_expenses", force: :cascade do |t|
    t.string "name"
    t.date "begin_date"
    t.string "periodicity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
  end

  add_foreign_key "person_recurring_expenses", "people"
  add_foreign_key "person_recurring_expenses", "recurring_expenses"
end
