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

ActiveRecord::Schema[7.1].define(version: 2024_03_03_032532) do
  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.index ["comment_id"], name: "index_boards_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "user_id"
    t.integer "row_number"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "board_id"
    t.index ["board_id"], name: "index_comments_on_board_id"
  end

  add_foreign_key "boards", "comments"
  add_foreign_key "comments", "boards"
end
