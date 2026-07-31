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



# IF THE MIGRATION NEEDS TO CHANGE LIVE DATA, PUSH TO
# PUSH THEM ALL ANYWAY FOR HISTORY

ActiveRecord::Schema[8.1].define(version: 2026_07_31_175548) do
  create_table "players", force: :cascade do |t|
    t.string "activity"
    t.datetime "created_at", null: false
    t.string "discord"
    t.string "name"
    t.string "steam_id"
    t.integer "unit_id"
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_players_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "players", "units"
end
