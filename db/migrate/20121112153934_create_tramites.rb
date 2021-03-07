class CreateTramites < ActiveRecord::Migration
  def change
    create_table :tramites do |t|
      t.integer :processo_id
      t.integer :setor_id_anterior
      t.integer :setor_id
      t.integer :usuario_id
      t.timestamps
    end
    add_index :tramites, :processo_id
    add_index :tramites, :setor_id_anterior
    add_index :tramites, :setor_id
    add_index :tramites, :usuario_id
  end
end
