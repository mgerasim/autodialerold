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

ActiveRecord::Schema.define(version: 2020_09_20_224839) do

  create_table "blves", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "uid"
    t.string "status"
    t.string "direction"
    t.string "other_leg"
    t.string "other_leg_domain"
    t.string "rank"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "peer"
    t.index ["task_id", "created_at"], name: "index_contacts_on_task_id_and_created_at"
    t.index ["task_id"], name: "index_contacts_on_task_id"
  end

  create_table "incommings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outgoings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.datetime "date_created"
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "callcount"
    t.text "sipnames"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "currentcount"
    t.string "outgoing"
    t.integer "sleep"
    t.boolean "is_enabled"
    t.integer "duration"
    t.boolean "autosps"
    t.string "incoming_context"
    t.integer "prev_outgoing_count", default: 0
    t.integer "prev_incomming_count", default: 0
    t.integer "current_outgoing_count", default: 0
    t.integer "outgoing_count_24h", default: 0
    t.integer "ingoing_count_24h", default: 0
    t.integer "version", default: 1
  end

  create_table "statsps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "countreg"
    t.integer "freeoper"
    t.integer "newsps"
    t.integer "abonqueue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "totalconfigs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title_setting_trunk"
    t.string "title_app"
    t.string "template_channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_random_peer", default: false
  end

  add_foreign_key "contacts", "tasks"
end
