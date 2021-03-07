class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :password_digest
      t.string :nome
      t.boolean :administrador
      t.boolean :autor
      t.boolean :desativado
      t.boolean :pode_alterar_setor
      t.timestamps
    end
    Usuario.create :login => :admin,
                   :password => :ManInBlack3,
                   :password_confirmation => :ManInBlack3,
                   :nome => :Administrador,
                   :administrador => true,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => 1

  end
end
