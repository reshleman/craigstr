
ActiveRecord::Schema.define(version: 20140805183913) do
  enable_extension "plpgsql"
  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "location_id"
  end
  create_table "locations", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false, null: false
  end
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
end
