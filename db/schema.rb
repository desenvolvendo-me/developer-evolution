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

ActiveRecord::Schema[7.0].define(version: 2023_06_09_192519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "title"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "keyquestions", force: :cascade do |t|
    t.string "title"
    t.bigint "purpose_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purpose_id"], name: "index_keyquestions_on_purpose_id"
  end

  create_table "practices", force: :cascade do |t|
    t.integer "commit_total"
    t.date "commit_date"
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_practices_on_student_id"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "version", limit: 5
    t.string "period", limit: 20
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_purposes_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.bigint "keyquestion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyquestion_id"], name: "index_questions_on_keyquestion_id"
  end

  create_table "routines", force: :cascade do |t|
    t.integer "day_of_the_week"
    t.time "hour"
    t.string "activity"
    t.string "priority"
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_routines_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "class_name"
    t.date "enrollment_date"
    t.string "type_career"
    t.string "description_career"
    t.float "salary"
    t.string "knowledge"
    t.string "profile_hotmart"
    t.string "profile_discord"
    t.integer "level_number"
    t.string "level_potential"
    t.string "level_testimony"
    t.integer "class_progress"
    t.string "meeting_situation"
    t.date "meeting_last"
    t.date "meeting_next"
    t.integer "meeting_number"
    t.string "meeting_link"
    t.string "github_link"
    t.integer "github_commit"
    t.string "github_intensity"
    t.string "wakatime_link"
    t.integer "wakatime_time"
    t.string "wakatime_intensity"
    t.string "linkedin_link"
    t.integer "linkedin_followers"
    t.integer "linkedin_post_last_month"
    t.string "linkedin_intensity"
    t.integer "challenge"
    t.string "mission_future"
    t.string "mission_future_generator"
    t.integer "mission_future_point"
    t.string "mission_base"
    t.string "mission_base_generator"
    t.integer "mission_base_point"
    t.string "mission_vacancy"
    t.string "mission_vacancy_generator"
    t.integer "mission_vacancy_point"
    t.string "mission_startup"
    t.string "mission_startup_generator"
    t.integer "mission_startup_point"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "keyquestions", "purposes"
  add_foreign_key "practices", "students"
  add_foreign_key "purposes", "students"
  add_foreign_key "questions", "keyquestions"
  add_foreign_key "routines", "students"
  add_foreign_key "students", "users"
end
