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

ActiveRecord::Schema.define(version: 2018_12_12_001148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fee_agent_name"
    t.string "fee_agent_email"
    t.string "fee_agent_phone_number"
    t.string "client_name"
    t.string "encrypted_client_last_four_ssn"
    t.string "encrypted_client_last_four_ssn_iv"
    t.text "attendee_names"
    t.boolean "selected_snap", default: false
    t.boolean "selected_medicaid", default: false
    t.boolean "selected_general_relief", default: false
    t.boolean "selected_atap", default: false
    t.boolean "selected_apa", default: false
    t.boolean "selected_cama", default: false
    t.boolean "explained_rights", default: false
    t.integer "any_not_listed", default: 0
    t.text "any_not_listed_names"
    t.integer "any_away_from_home", default: 0
    t.text "any_away_from_home_names"
    t.integer "anyone_convicted_drug_felony", default: 0
    t.string "arrival_in_alaska"
    t.integer "intend_to_stay", default: 0
    t.string "convicted_drug_felony_name"
    t.integer "completed_probation_or_parole", default: 0
    t.integer "completed_treatment_program", default: 0
    t.integer "taken_action_towards_rehabilitation", default: 0
    t.integer "complied_with_reentry", default: 0
    t.integer "anyone_tribe", default: 0
    t.text "tribe_details"
  end

  create_table "navigators", force: :cascade do |t|
    t.bigint "interview_id"
    t.integer "interview_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lived_outside_alaska", default: 0
    t.index ["interview_id"], name: "index_navigators_on_interview_id"
  end

end
