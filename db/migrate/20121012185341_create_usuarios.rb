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
                   :pode_alterar_setor => false

    Usuario.create :login => 'paulo.campaneli',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Paulo Campaneli',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false

    Usuario.create :login => 'paulo.cesar',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Paulo Cesar',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false

    Usuario.create :login => 'cristiano.bragatto',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Cristiano Bragatto',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false

    Usuario.create :login => 'marcelo.pereira',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Marcelo Pereira',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false

    Usuario.create :login => 'julio.costa',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Julio Cesar Costa',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false

    Usuario.create :login => 'heber.nunomura',
                   :password => 'P@ssw0rd1',
                   :password_confirmation => 'P@ssw0rd1',
                   :nome => 'Heber Nunomura',
                   :administrador => false,
                   :autor => true,
                   :desativado => false,
                   :pode_alterar_setor => false
  end
end
