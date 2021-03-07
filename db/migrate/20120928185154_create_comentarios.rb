class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :descricao
      t.integer :processo_id
      t.integer :usuario_id
      t.timestamps
    end
    add_index :comentarios, :processo_id
    add_index :comentarios, :usuario_id
  end
end
