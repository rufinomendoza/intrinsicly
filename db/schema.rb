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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121208194216) do

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "industry"
    t.float    "wacc",         :default => 0.08
    t.float    "terminal",     :default => 0.03
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.float    "current_debt", :default => 0.0
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.float    "wacc",       :default => 0.08
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "statements", :force => true do |t|
    t.integer  "period",     :default => 2012
    t.float    "revenue",    :default => 0.0
    t.float    "cgs",        :default => 0.0
    t.float    "opex",       :default => 0.0
    t.float    "da",         :default => 0.0
    t.float    "tax",        :default => 0.0
    t.float    "capex",      :default => 0.0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.float    "interest",   :default => 0.0
    t.float    "nwc_chg",    :default => 0.0
  end

end
