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

ActiveRecord::Schema[7.1].define(version: 2024_08_09_132230) do
  create_table "entries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.string "content"
    t.integer "user_id"
    t.integer "mood_rating", limit: 1
    t.integer "sleep_quality_hours"
    t.integer "sleep_quality_rating"
    t.string "exercise_type"
    t.string "exercise_intensity"
    t.boolean "skipped_meals"
    t.integer "anxiety_level"
    t.integer "stress_level"
    t.integer "energy_level"
    t.boolean "happiness"
    t.integer "work_hours"
    t.integer "social_interactions_time"
    t.integer "hobbies_time"
    t.integer "mindfulness_time"
    t.boolean "unexpected_changes"
    t.text "journaling_thoughts"
    t.text "positive_affirmations"
    t.text "notable_dreams"
    t.integer "score"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "level"
    t.check_constraint "level >= 0 AND level <= 2", name: "level_range"
  end

  add_foreign_key "entries", "users"
end
