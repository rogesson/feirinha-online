class CreateTable < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Schema.define(version: 2020_04_18_224148) do

      create_table "categories", force: :cascade do |t|
        t.string "name", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "payments", force: :cascade do |t|
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.bigint 'status_id', null: false
        t.bigint 'user_id', null: false
        t.index [:status_id], name: "index_payments_on_status_id"
        t.index [:user_id], name: "index_payments_on_user_id"
      end

      create_table "products", force: :cascade do |t|
        t.string "name", null: false
        t.float "price", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.bigint ':category_id', null: false
        t.bigint ':store_id', null: false
        t.index [:category_id], name: "index_products_on_category_id"
        t.index [:store_id], name: "index_products_on_store_id"
      end

      create_table "roles", force: :cascade do |t|
        t.string "name", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "status", force: :cascade do |t|
        t.string "name", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "stores", force: :cascade do |t|
        t.string "locale", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.bigint 'category_id', null: false
        t.bigint 'status_id', null: false
        t.bigint 'user_id', null: false
        t.index [:category_id], name: "index_stores_on_category_id"
        t.index [:status_id], name: "index_stores_on_status_id"
        t.index [:user_id], name: "index_stores_on_user_id"
      end

      create_table "user_roles", force: :cascade do |t|
        t.integer "user_id", null: false
        t.integer "role_id", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["role_id"], name: "index_user_roles_on_role_id"
        t.index ["user_id"], name: "index_user_roles_on_user_id"
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
        t.string "authentication_token", limit: 30
        t.bigint "role_id", null: false
        t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
        t.index ["email"], name: "index_users_on_email", unique: true
        t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
        t.index [:role_id], name: "index_users_on_role_id"
      end
    end
  end
end