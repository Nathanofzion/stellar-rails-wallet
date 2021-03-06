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

ActiveRecord::Schema.define(version: 20180831115240) do

  create_table "federations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "username", null: false
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "synced", default: false
    t.string "email_confirmation_token"
    t.boolean "email_confirmed", default: false
    t.timestamp "email_confirmation_generated_at"
    t.integer "emails_sent", default: 1
    t.index ["address"], name: "index_federations_on_address", unique: true, length: { address: 255 }
    t.index ["email_confirmation_token"], name: "index_federations_on_email_confirmation_token", unique: true
    t.index ["username", "address"], name: "index_federations_on_username_and_address", unique: true, length: { username: 255, address: 255 }
    t.index ["username"], name: "index_federations_on_username", unique: true, length: { username: 255 }
  end

end
