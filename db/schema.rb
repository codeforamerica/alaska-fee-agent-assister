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

ActiveRecord::Schema.define(version: 2019_01_23_184639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "interviews", force: :cascade do |t|
    t.boolean "all_ssns_included"
    t.integer "any_away_from_home", default: 0
    t.text "any_away_from_home_names"
    t.integer "any_not_listed", default: 0
    t.text "any_not_listed_names"
    t.integer "anyone_convicted_drug_felony", default: 0
    t.integer "anyone_filing_tax_return", default: 0
    t.integer "anyone_stopped_work", default: 0
    t.integer "anyone_tribe", default: 0
    t.integer "approved_for_disability", default: 0
    t.string "arrival_in_alaska"
    t.text "attendee_names"
    t.text "cama_details"
    t.string "client_name"
    t.boolean "client_sign_and_date"
    t.integer "completed_probation_or_parole", default: 0
    t.integer "completed_treatment_program", default: 0
    t.integer "complied_with_reentry", default: 0
    t.string "convicted_drug_felony_name"
    t.datetime "created_at", null: false
    t.string "encrypted_client_last_four_ssn"
    t.string "encrypted_client_last_four_ssn_iv"
    t.string "expenses_payment_details"
    t.boolean "explained_rights", default: false
    t.boolean "fa_sign_and_date"
    t.string "fee_agent_email"
    t.string "fee_agent_name"
    t.string "fee_agent_phone_number"
    t.text "filing_tax_return_details"
    t.boolean "has_child_care_expense", default: false
    t.boolean "has_child_support_expense", default: false
    t.boolean "has_electricity_expense", default: false
    t.boolean "has_home_insurance_expense", default: false
    t.boolean "has_medical_care_medicine_expense", default: false
    t.boolean "has_oil_expense", default: false
    t.boolean "has_propane_gas_expense", default: false
    t.boolean "has_property_tax_expense", default: false
    t.integer "has_quest_card", default: 0
    t.boolean "has_rent_mortgage_expense", default: false
    t.boolean "has_space_rent_expense", default: false
    t.boolean "has_telephone_expense", default: false
    t.boolean "has_water_sewage_expense", default: false
    t.boolean "has_wood_coal_expense", default: false
    t.integer "intend_to_stay", default: 0
    t.text "other_info"
    t.boolean "selected_apa", default: false
    t.boolean "selected_atap", default: false
    t.boolean "selected_cama", default: false
    t.boolean "selected_general_relief", default: false
    t.boolean "selected_medicaid", default: false
    t.boolean "selected_snap", default: false
    t.text "stopped_work_details"
    t.integer "taken_action_towards_rehabilitation", default: 0
    t.text "tribe_details"
    t.datetime "updated_at", null: false
  end

  create_table "navigators", force: :cascade do |t|
    t.boolean "children_in_home", default: false
    t.boolean "citizen", default: false
    t.datetime "created_at", null: false
    t.boolean "interim_assistance", default: false
    t.bigint "interview_id"
    t.integer "interview_type", default: 0
    t.integer "lived_outside_alaska", default: 0
    t.boolean "parent_not_in_home", default: false
    t.boolean "pregnant", default: false
    t.datetime "updated_at", null: false
    t.boolean "want_direct_deposit", default: false
    t.index ["interview_id"], name: "index_navigators_on_interview_id"
  end

end
