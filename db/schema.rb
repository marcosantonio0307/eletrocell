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

ActiveRecord::Schema.define(version: 2019_04_06_210125) do

  create_table "despesas", force: :cascade do |t|
    t.string "tipo"
    t.text "descricao"
    t.decimal "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data"
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "venda_id"
    t.decimal "valor_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade"
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id"
    t.index ["venda_id"], name: "index_item_pedidos_on_venda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "quantidade"
    t.decimal "preco_custo"
    t.decimal "preco_venda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", force: :cascade do |t|
    t.decimal "valor_total"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cliente"
  end

end
