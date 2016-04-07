# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160407021741) do

  create_table "available_times", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date_at"
    t.time     "start_at"
    t.time     "end_at"
    t.string   "week_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cash_transactions", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "amount"
    t.boolean  "is_permitted", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "lang"
    t.string "rank"
    t.string "subject"
    t.text   "content"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_free"
    t.integer  "course_id"
    t.boolean  "confirmed",  default: false
  end

  create_table "memos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_comments", force: :cascade do |t|
    t.integer  "commentor_id"
    t.integer  "commentee_id"
    t.text     "text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teacher_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "major"
    t.string   "school_grad"
    t.text     "introduction"
    t.string   "location"
    t.boolean  "is_approved",    default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "gender"
    t.integer  "lecture_price"
    t.integer  "lecture_number"
    t.integer  "rating"
    t.integer  "student_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name",                                   null: false
    t.string   "lang_to_learn",                          null: false
    t.string   "native_lang",                            null: false
    t.boolean  "is_teacher",             default: true
    t.boolean  "is_admin",               default: false
    t.integer  "cash",                   default: 0
    t.string   "profile_pic"
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
