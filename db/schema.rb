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

ActiveRecord::Schema.define(version: 2022_12_22_080619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "cno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "gno"
    t.integer "major_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.string "mno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors_courses", force: :cascade do |t|
    t.integer "major_id"
    t.integer "course_id"
    t.float "credit"
    t.boolean "compulsory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "start_time"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "stuno"
    t.string "birth"
    t.boolean "male"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.float "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "make_up", default: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "tno"
    t.integer "major_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "groups", "majors", name: "groups_major_id_fkey"
  add_foreign_key "majors_courses", "courses", name: "majors_courses_course_id_fkey"
  add_foreign_key "majors_courses", "majors", name: "majors_courses_major_id_fkey"
  add_foreign_key "students", "groups", name: "students_group_id_fkey"
  add_foreign_key "students_courses", "courses", name: "students_courses_course_id_fkey"
  add_foreign_key "students_courses", "students", name: "students_courses_student_id_fkey"
  add_foreign_key "teachers", "majors", name: "teachers_major_id_fkey"
  add_foreign_key "teachers_courses", "courses", name: "teachers_courses_course_id_fkey"
  add_foreign_key "teachers_courses", "groups", name: "teachers_courses_group_id_fkey"
  add_foreign_key "teachers_courses", "teachers", name: "teachers_courses_teacher_id_fkey"
end
