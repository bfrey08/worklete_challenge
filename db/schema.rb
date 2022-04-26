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

ActiveRecord::Schema.define(version: 2022_04_04_171447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "learners", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.string "result"
    t.bigint "quiz_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_quiz_questions_on_question_id"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "learner_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learner_id"], name: "index_quizzes_on_learner_id"
    t.index ["manager_id"], name: "index_quizzes_on_manager_id"
  end

  add_foreign_key "quiz_questions", "questions"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "learners"
  add_foreign_key "quizzes", "managers"
end
