# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_29_012906) do
  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_collections_on_owner_id"
  end

  create_table "recipe_collections", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_recipe_collections_on_collection_id"
    t.index ["recipe_id"], name: "index_recipe_collections_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "url"
    t.string "dish_name"
    t.text "ingredients"
    t.text "directions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prep_time"
    t.string "total_time"
  end

  create_table "scraped_recipes", force: :cascade do |t|
    t.boolean "saved_recipe"
    t.integer "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_scraped_recipes_on_collection_id"
  end

  add_foreign_key "collections", "owners"
  add_foreign_key "recipe_collections", "collections"
  add_foreign_key "recipe_collections", "recipes"
  add_foreign_key "scraped_recipes", "collections"
end
