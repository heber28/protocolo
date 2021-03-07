class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
      t.references :processo
      t.string :arquivo
      t.timestamps
    end
    add_index :arquivos, :processo_id
  end
end
