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

ActiveRecord::Schema.define(version: 20160905210037) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "campaign_type"
    t.text     "description"
    t.decimal  "target_funding"
    t.decimal  "current_funding"
    t.date     "target_deadline"
    t.text     "notes"
    t.string   "status"
    t.string   "banner_image"
    t.integer  "partner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["partner_id", "created_at"], name: "index_campaigns_on_partner_id_and_created_at"
    t.index ["partner_id"], name: "index_campaigns_on_partner_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.date     "birthday"
    t.string   "country"
    t.text     "bio"
    t.boolean  "monthly_fund"
    t.boolean  "anual_fund"
    t.boolean  "anonymous"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_donors_on_email", unique: true
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "contact_name"
    t.string   "email_2"
    t.string   "contact_name_2"
    t.string   "partner_type"
    t.text     "address"
    t.text     "description"
    t.string   "phone"
    t.integer  "case_count"
    t.decimal  "average_cost"
    t.decimal  "average_update_time"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["username"], name: "index_partners_on_username", unique: true
  end

end
