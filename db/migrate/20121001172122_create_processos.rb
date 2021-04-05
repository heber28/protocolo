class CreateProcessos < ActiveRecord::Migration
  def change
    create_table :processos do |t|
      t.string :assunto
      t.text :descricao
      t.integer :usuario_id
      t.integer :setor_id # setor onde foi criado o processo
      t.integer :setor_id_atual # setor onde esta o processo
      t.integer :numero_git
      t.string :nome
      t.string :cpf
      t.string :cnpj
      t.datetime :data_tramite
      t.timestamps
    end
    add_index :processos, :usuario_id
    add_index :processos, :setor_id
    add_index :processos, :setor_id_atual
  end
end
