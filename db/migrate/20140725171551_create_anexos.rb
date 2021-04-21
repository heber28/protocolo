class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.references :processo
      t.string :arquivo
      t.integer :usuario_id
      t.timestamps
    end
    add_index :anexos, :processo_id
    add_index :anexos, :usuario_id
  end
end
