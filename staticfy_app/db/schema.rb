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

ActiveRecord::Schema[7.1].define(version: 2024_09_22_004426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "difficulty", default: 0, null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multi_choice_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "multi_choice_question_id"
    t.string "selected_choice", null: false
    t.boolean "is_correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_choice_question_id"], name: "index_multi_choice_answers_on_multi_choice_question_id"
    t.index ["user_id"], name: "index_multi_choice_answers_on_user_id"
  end

  create_table "multi_choice_questions", force: :cascade do |t|
    t.bigint "task_id"
    t.integer "difficulty", default: 0, null: false
    t.string "question", null: false
    t.string "choice_1", null: false
    t.string "choice_2", null: false
    t.string "choice_3"
    t.string "choice_4"
    t.string "correct_answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_multi_choice_questions_on_task_id"
  end

  create_table "numeric_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "numeric_question_id"
    t.string "content", null: false
    t.boolean "is_correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["numeric_question_id"], name: "index_numeric_answers_on_numeric_question_id"
    t.index ["user_id"], name: "index_numeric_answers_on_user_id"
  end

  create_table "numeric_questions", force: :cascade do |t|
    t.bigint "task_id"
    t.integer "difficulty", default: 0, null: false
    t.string "question", null: false
    t.string "correct_answer", null: false
    t.float "tolerance", null: false
    t.string "unit", null: false
    t.string "hint_1", null: false
    t.string "hint_2", null: false
    t.string "hint_3", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_numeric_questions_on_task_id"
  end

  create_table "numeric_templates", force: :cascade do |t|
    t.bigint "numeric_question_id"
    t.string "diagram_data", null: false
    t.string "values", null: false
    t.string "magnitudes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["numeric_question_id"], name: "index_numeric_templates_on_numeric_question_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "task_type", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.boolean "is_finished", default: false, null: false
    t.integer "wrong_counter"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_tasks_on_course_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.integer "progress", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "student"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "multi_choice_answers", "multi_choice_questions"
  add_foreign_key "multi_choice_answers", "users"
  add_foreign_key "multi_choice_questions", "tasks"
  add_foreign_key "numeric_answers", "numeric_questions"
  add_foreign_key "numeric_answers", "users"
  add_foreign_key "numeric_questions", "tasks"
  add_foreign_key "numeric_templates", "numeric_questions"
  add_foreign_key "tasks", "courses"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
end
