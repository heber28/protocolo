class CreateProcessoTags < ActiveRecord::Migration
  def change
    create_table :processo_tags do |t|
      t.references :processo
      t.references :tag

      t.timestamps
    end
    add_index :processo_tags, :processo_id
    add_index :processo_tags, :tag_id
  end
end
