# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150922195138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "actors", ["full_name"], name: "index_actors_on_full_name", using: :btree

  create_table "directors", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "directors", ["full_name"], name: "index_directors_on_full_name", using: :btree

  create_table "distributors", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "distributors", ["name"], name: "index_distributors_on_name", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address",    null: false
    t.float    "latitude",  null: false
    t.float    "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "fun_facts"
  end

  add_index "locations", ["latitude"], name: "index_locations_on_latitude", using: :btree
  add_index "locations", ["longitude"], name: "index_locations_on_longitude", using: :btree

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
  end

  add_index "movie_actors", ["actor_id"], name: "index_movie_actors_on_actor_id", using: :btree
  add_index "movie_actors", ["movie_id"], name: "index_movie_actors_on_movie_id", using: :btree

  create_table "movie_locations", force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "location_id", null: false
  end

  add_index "movie_locations", ["location_id"], name: "index_movie_locations_on_location_id", using: :btree
  add_index "movie_locations", ["movie_id"], name: "index_movie_locations_on_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title",                 null: false
    t.integer  "release_year",          null: false
    t.integer  "director_id"
    t.integer  "distributor_id"
    t.integer  "production_company_id"
    t.integer  "writer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "movies", ["director_id"], name: "index_movies_on_director_id", using: :btree
  add_index "movies", ["distributor_id"], name: "index_movies_on_distributor_id", using: :btree
  add_index "movies", ["production_company_id"], name: "index_movies_on_production_company_id", using: :btree
  add_index "movies", ["title"], name: "index_movies_on_title", using: :btree
  add_index "movies", ["writer_id"], name: "index_movies_on_writer_id", using: :btree

  create_table "production_companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "production_companies", ["name"], name: "index_production_companies_on_name", using: :btree

  create_table "writers", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "writers", ["full_name"], name: "index_writers_on_full_name", using: :btree

end
