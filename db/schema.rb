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

ActiveRecord::Schema.define(version: 20170814144611) do

  create_table "diys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "text",       limit: 65535
    t.binary   "image",      limit: 65535
    t.text     "video",      limit: 65535
    t.text     "title1",     limit: 65535
    t.text     "contents1",  limit: 65535
    t.binary   "image1",     limit: 65535
    t.text     "title2",     limit: 65535
    t.text     "contents2",  limit: 65535
    t.binary   "image2",     limit: 65535
    t.text     "title3",     limit: 65535
    t.text     "contents3",  limit: 65535
    t.binary   "image3",     limit: 65535
    t.text     "title4",     limit: 65535
    t.text     "contents4",  limit: 65535
    t.binary   "image4",     limit: 65535
    t.text     "title5",     limit: 65535
    t.text     "contents5",  limit: 65535
    t.binary   "image5",     limit: 65535
    t.text     "prefecture", limit: 65535
    t.text     "area",       limit: 65535
    t.text     "address",    limit: 65535
    t.text     "name",       limit: 65535
    t.text     "station",    limit: 65535
    t.text     "call",       limit: 65535
    t.text     "access",     limit: 65535
    t.text     "open",       limit: 65535
    t.text     "url",        limit: 65535
    t.text     "instagram",  limit: 65535
    t.text     "category",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "impressions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.text     "params",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", length: { params: 255 }, using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: { message: 255 }, using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",                       collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535
    t.binary   "image",      limit: 65535
    t.text     "tagname",    limit: 65535
    t.binary   "topvideo",   limit: 65535
    t.text     "post1",      limit: 65535
    t.binary   "video1",     limit: 65535
    t.text     "post2",      limit: 65535
    t.binary   "video2",     limit: 65535
    t.text     "post3",      limit: 65535
    t.binary   "video3",     limit: 65535
    t.text     "post4",      limit: 65535
    t.binary   "video4",     limit: 65535
    t.text     "post5",      limit: 65535
    t.binary   "video5",     limit: 65535
    t.text     "post6",      limit: 65535
    t.binary   "video6",     limit: 65535
    t.text     "post7",      limit: 65535
    t.binary   "video7",     limit: 65535
    t.text     "post8",      limit: 65535
    t.binary   "video8",     limit: 65535
    t.text     "post9",      limit: 65535
    t.binary   "video9",     limit: 65535
    t.text     "post10",     limit: 65535
    t.binary   "video10",    limit: 65535
    t.text     "post11",     limit: 65535
    t.binary   "video11",    limit: 65535
    t.text     "post12",     limit: 65535
    t.binary   "video12",    limit: 65535
    t.text     "post13",     limit: 65535
    t.binary   "video13",    limit: 65535
    t.text     "post14",     limit: 65535
    t.binary   "video14",    limit: 65535
    t.text     "post15",     limit: 65535
    t.binary   "video15",    limit: 65535
    t.text     "post16",     limit: 65535
    t.binary   "video16",    limit: 65535
    t.text     "post17",     limit: 65535
    t.binary   "video17",    limit: 65535
    t.text     "post18",     limit: 65535
    t.binary   "video18",    limit: 65535
    t.text     "post19",     limit: 65535
    t.binary   "video19",    limit: 65535
    t.text     "post20",     limit: 65535
    t.binary   "video20",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
