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

ActiveRecord::Schema.define(version: 20180307185315) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "spot_id"
  end

  create_table "artists_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_artists_users_on_artist_id"
    t.index ["user_id"], name: "index_artists_users_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_genres_users_on_genre_id"
    t.index ["user_id"], name: "index_genres_users_on_user_id"
  end

  create_table "seeds", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.text    "seed"
  end

  create_table "tracks", force: :cascade do |t|
    t.string  "name"
    t.integer "artist_id"
    t.integer "genre_id"
    t.string  "spot_id"
  end

  create_table "tracks_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "track_id", null: false
    t.index ["track_id"], name: "index_tracks_users_on_track_id"
    t.index ["user_id"], name: "index_tracks_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
