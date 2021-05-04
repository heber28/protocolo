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

ActiveRecord::Schema.define(:version => 20210430182029) do

  create_table "anexos", :force => true do |t|
    t.integer  "processo_id"
    t.string   "arquivo"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "anexos", ["processo_id"], :name => "index_anexos_on_processo_id"
  add_index "anexos", ["usuario_id"], :name => "index_anexos_on_usuario_id"

  create_table "comentarios", :force => true do |t|
    t.text     "descricao"
    t.integer  "processo_id"
    t.integer  "usuario_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comentarios", ["processo_id"], :name => "index_comentarios_on_processo_id"
  add_index "comentarios", ["usuario_id"], :name => "index_comentarios_on_usuario_id"

  create_table "indicacoes", :force => true do |t|
    t.string   "numero_auto_infracao"
    t.string   "arquivo_notificacao"
    t.string   "arquivo_cnh_condutor_infrator"
    t.string   "arquivo_doc_proprietario"
    t.string   "arquivo_contrato_social"
    t.string   "arquivo_procuracao"
    t.string   "arquivo_contrato_responsabilidade"
    t.string   "email_para_retorno"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "processos", :force => true do |t|
    t.string   "assunto"
    t.text     "descricao"
    t.integer  "usuario_id"
    t.integer  "setor_id"
    t.integer  "setor_id_atual"
    t.integer  "numero_git"
    t.string   "nome"
    t.string   "cpf"
    t.string   "cnpj"
    t.datetime "data_tramite"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "processos", ["setor_id"], :name => "index_processos_on_setor_id"
  add_index "processos", ["setor_id_atual"], :name => "index_processos_on_setor_id_atual"
  add_index "processos", ["usuario_id"], :name => "index_processos_on_usuario_id"

  create_table "recursos", :force => true do |t|
    t.string   "numero_auto_infracao"
    t.string   "email_para_retorno"
    t.string   "arquivo_notificacao"
    t.string   "arquivo_recurso"
    t.string   "arquivo_cnh"
    t.string   "arquivo_crlv"
    t.string   "arquivo_procuracao"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "setores", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tramites", :force => true do |t|
    t.integer  "processo_id"
    t.integer  "setor_id_anterior"
    t.integer  "setor_id"
    t.integer  "usuario_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "tramites", ["processo_id"], :name => "index_tramites_on_processo_id"
  add_index "tramites", ["setor_id"], :name => "index_tramites_on_setor_id"
  add_index "tramites", ["setor_id_anterior"], :name => "index_tramites_on_setor_id_anterior"
  add_index "tramites", ["usuario_id"], :name => "index_tramites_on_usuario_id"

  create_table "usuario_setores", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "setor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "nome"
    t.boolean  "administrador"
    t.boolean  "autor"
    t.boolean  "desativado"
    t.boolean  "pode_alterar_setor"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
