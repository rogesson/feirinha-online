ActiveRecord::Schema.define(version: 2020_04_18_190723) do

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [:status_id], name: "index_payments_on_status_id"
    t.index [:user_id], name: "index_payments_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [:category_id], name: "index_products_on_category_id"
    t.index [:store_id], name: "index_products_on_store_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [:category_id], name: "index_stores_on_category_id"
    t.index [:status_id], name: "index_stores_on_status_id"
    t.index [:user_id], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index [:role_id], name: "index_users_on_role_id"
  end

end
