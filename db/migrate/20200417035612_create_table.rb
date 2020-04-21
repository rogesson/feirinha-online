class CreateTable < ActiveRecord::Migration[5.2]
  def change
    create_table "categories", force: :cascade do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "payments", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "status_id", null: false
      t.bigint "user_id", null: false
      t.index ["status_id"], name: "index_payments_on_status_id"
      t.index ["user_id"], name: "index_payments_on_user_id"
    end

    create_table "products", force: :cascade do |t|
      t.string "name", null: false
      t.float "price", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "category_id", null: false
      t.bigint "store_id", null: false
      t.index ["category_id"], name: "index_products_on_category_id"
      t.index ["store_id"], name: "index_products_on_store_id"
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
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "category_id", null: false
      t.integer "user_id", null: false
      t.string "name"
      t.index ["category_id"], name: "index_stores_on_category_id"
      t.index ["user_id"], name: "index_stores_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "name", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
