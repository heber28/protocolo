class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
      t.references :processo
      t.string :arquivo
      t.integer :usuario_id
      t.timestamps
    end
    add_index :arquivos, :processo_id
    add_index :arquivos, :usuario_id
  end
end
