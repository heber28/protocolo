class CreateUsuarioSetores < ActiveRecord::Migration
  def change
    create_table :usuario_setores do |t|
      t.integer :usuario_id
      t.integer :setor_id

      t.timestamps
    end
    UsuarioSetor.create :usuario_id => 1, :setor_id => 1
    UsuarioSetor.create :usuario_id => 1, :setor_id => 2
    UsuarioSetor.create :usuario_id => 1, :setor_id => 3
    UsuarioSetor.create :usuario_id => 1, :setor_id => 4
    UsuarioSetor.create :usuario_id => 1, :setor_id => 5
    UsuarioSetor.create :usuario_id => 1, :setor_id => 6
    UsuarioSetor.create :usuario_id => 1, :setor_id => 7
    UsuarioSetor.create :usuario_id => 1, :setor_id => 8
    UsuarioSetor.create :usuario_id => 1, :setor_id => 9
    UsuarioSetor.create :usuario_id => 1, :setor_id => 10
    UsuarioSetor.create :usuario_id => 1, :setor_id => 11
    UsuarioSetor.create :usuario_id => 1, :setor_id => 12
    UsuarioSetor.create :usuario_id => 1, :setor_id => 13
    UsuarioSetor.create :usuario_id => 1, :setor_id => 14
    UsuarioSetor.create :usuario_id => 1, :setor_id => 15
    UsuarioSetor.create :usuario_id => 1, :setor_id => 16
    UsuarioSetor.create :usuario_id => 1, :setor_id => 17
    UsuarioSetor.create :usuario_id => 1, :setor_id => 18
    UsuarioSetor.create :usuario_id => 1, :setor_id => 19
    UsuarioSetor.create :usuario_id => 1, :setor_id => 20

    UsuarioSetor.create :usuario_id => 2, :setor_id => 1
    UsuarioSetor.create :usuario_id => 2, :setor_id => 2
    UsuarioSetor.create :usuario_id => 2, :setor_id => 3
    UsuarioSetor.create :usuario_id => 2, :setor_id => 4
    UsuarioSetor.create :usuario_id => 2, :setor_id => 5
    UsuarioSetor.create :usuario_id => 2, :setor_id => 6
    UsuarioSetor.create :usuario_id => 2, :setor_id => 7
    UsuarioSetor.create :usuario_id => 2, :setor_id => 8
    UsuarioSetor.create :usuario_id => 2, :setor_id => 9
    UsuarioSetor.create :usuario_id => 2, :setor_id => 10
    UsuarioSetor.create :usuario_id => 2, :setor_id => 11
    UsuarioSetor.create :usuario_id => 2, :setor_id => 12
    UsuarioSetor.create :usuario_id => 2, :setor_id => 13
    UsuarioSetor.create :usuario_id => 2, :setor_id => 14
    UsuarioSetor.create :usuario_id => 2, :setor_id => 15
    UsuarioSetor.create :usuario_id => 2, :setor_id => 16
    UsuarioSetor.create :usuario_id => 2, :setor_id => 17
    UsuarioSetor.create :usuario_id => 2, :setor_id => 18
    UsuarioSetor.create :usuario_id => 2, :setor_id => 19
    UsuarioSetor.create :usuario_id => 2, :setor_id => 20

    UsuarioSetor.create :usuario_id => 3, :setor_id => 1
    UsuarioSetor.create :usuario_id => 3, :setor_id => 2
    UsuarioSetor.create :usuario_id => 3, :setor_id => 3
    UsuarioSetor.create :usuario_id => 3, :setor_id => 4
    UsuarioSetor.create :usuario_id => 3, :setor_id => 5
    UsuarioSetor.create :usuario_id => 3, :setor_id => 6
    UsuarioSetor.create :usuario_id => 3, :setor_id => 7
    UsuarioSetor.create :usuario_id => 3, :setor_id => 8
    UsuarioSetor.create :usuario_id => 3, :setor_id => 9
    UsuarioSetor.create :usuario_id => 3, :setor_id => 10
    UsuarioSetor.create :usuario_id => 3, :setor_id => 11
    UsuarioSetor.create :usuario_id => 3, :setor_id => 12
    UsuarioSetor.create :usuario_id => 3, :setor_id => 13
    UsuarioSetor.create :usuario_id => 3, :setor_id => 14
    UsuarioSetor.create :usuario_id => 3, :setor_id => 15
    UsuarioSetor.create :usuario_id => 3, :setor_id => 16
    UsuarioSetor.create :usuario_id => 3, :setor_id => 17
    UsuarioSetor.create :usuario_id => 3, :setor_id => 18
    UsuarioSetor.create :usuario_id => 3, :setor_id => 19
    UsuarioSetor.create :usuario_id => 3, :setor_id => 20

    UsuarioSetor.create :usuario_id => 4, :setor_id => 1
    UsuarioSetor.create :usuario_id => 4, :setor_id => 2
    UsuarioSetor.create :usuario_id => 4, :setor_id => 3
    UsuarioSetor.create :usuario_id => 4, :setor_id => 4
    UsuarioSetor.create :usuario_id => 4, :setor_id => 5
    UsuarioSetor.create :usuario_id => 4, :setor_id => 6
    UsuarioSetor.create :usuario_id => 4, :setor_id => 7
    UsuarioSetor.create :usuario_id => 4, :setor_id => 8
    UsuarioSetor.create :usuario_id => 4, :setor_id => 9
    UsuarioSetor.create :usuario_id => 4, :setor_id => 10
    UsuarioSetor.create :usuario_id => 4, :setor_id => 11
    UsuarioSetor.create :usuario_id => 4, :setor_id => 12
    UsuarioSetor.create :usuario_id => 4, :setor_id => 13
    UsuarioSetor.create :usuario_id => 4, :setor_id => 14
    UsuarioSetor.create :usuario_id => 4, :setor_id => 15
    UsuarioSetor.create :usuario_id => 4, :setor_id => 16
    UsuarioSetor.create :usuario_id => 4, :setor_id => 17
    UsuarioSetor.create :usuario_id => 4, :setor_id => 18
    UsuarioSetor.create :usuario_id => 4, :setor_id => 19
    UsuarioSetor.create :usuario_id => 4, :setor_id => 20

    UsuarioSetor.create :usuario_id => 5, :setor_id => 1
    UsuarioSetor.create :usuario_id => 5, :setor_id => 2
    UsuarioSetor.create :usuario_id => 5, :setor_id => 3
    UsuarioSetor.create :usuario_id => 5, :setor_id => 4
    UsuarioSetor.create :usuario_id => 5, :setor_id => 5
    UsuarioSetor.create :usuario_id => 5, :setor_id => 6
    UsuarioSetor.create :usuario_id => 5, :setor_id => 7
    UsuarioSetor.create :usuario_id => 5, :setor_id => 8
    UsuarioSetor.create :usuario_id => 5, :setor_id => 9
    UsuarioSetor.create :usuario_id => 5, :setor_id => 10
    UsuarioSetor.create :usuario_id => 5, :setor_id => 11
    UsuarioSetor.create :usuario_id => 5, :setor_id => 12
    UsuarioSetor.create :usuario_id => 5, :setor_id => 13
    UsuarioSetor.create :usuario_id => 5, :setor_id => 14
    UsuarioSetor.create :usuario_id => 5, :setor_id => 15
    UsuarioSetor.create :usuario_id => 5, :setor_id => 16
    UsuarioSetor.create :usuario_id => 5, :setor_id => 17
    UsuarioSetor.create :usuario_id => 5, :setor_id => 18
    UsuarioSetor.create :usuario_id => 5, :setor_id => 19
    UsuarioSetor.create :usuario_id => 5, :setor_id => 20

    UsuarioSetor.create :usuario_id => 6, :setor_id => 1
    UsuarioSetor.create :usuario_id => 6, :setor_id => 2
    UsuarioSetor.create :usuario_id => 6, :setor_id => 3
    UsuarioSetor.create :usuario_id => 6, :setor_id => 4
    UsuarioSetor.create :usuario_id => 6, :setor_id => 5
    UsuarioSetor.create :usuario_id => 6, :setor_id => 6
    UsuarioSetor.create :usuario_id => 6, :setor_id => 7
    UsuarioSetor.create :usuario_id => 6, :setor_id => 8
    UsuarioSetor.create :usuario_id => 6, :setor_id => 9
    UsuarioSetor.create :usuario_id => 6, :setor_id => 10
    UsuarioSetor.create :usuario_id => 6, :setor_id => 11
    UsuarioSetor.create :usuario_id => 6, :setor_id => 12
    UsuarioSetor.create :usuario_id => 6, :setor_id => 13
    UsuarioSetor.create :usuario_id => 6, :setor_id => 14
    UsuarioSetor.create :usuario_id => 6, :setor_id => 15
    UsuarioSetor.create :usuario_id => 6, :setor_id => 16
    UsuarioSetor.create :usuario_id => 6, :setor_id => 17
    UsuarioSetor.create :usuario_id => 6, :setor_id => 18
    UsuarioSetor.create :usuario_id => 6, :setor_id => 19
    UsuarioSetor.create :usuario_id => 6, :setor_id => 20

    UsuarioSetor.create :usuario_id => 7, :setor_id => 1
    UsuarioSetor.create :usuario_id => 7, :setor_id => 2
    UsuarioSetor.create :usuario_id => 7, :setor_id => 3
    UsuarioSetor.create :usuario_id => 7, :setor_id => 4
    UsuarioSetor.create :usuario_id => 7, :setor_id => 5
    UsuarioSetor.create :usuario_id => 7, :setor_id => 6
    UsuarioSetor.create :usuario_id => 7, :setor_id => 7
    UsuarioSetor.create :usuario_id => 7, :setor_id => 8
    UsuarioSetor.create :usuario_id => 7, :setor_id => 9
    UsuarioSetor.create :usuario_id => 7, :setor_id => 10
    UsuarioSetor.create :usuario_id => 7, :setor_id => 11
    UsuarioSetor.create :usuario_id => 7, :setor_id => 12
    UsuarioSetor.create :usuario_id => 7, :setor_id => 13
    UsuarioSetor.create :usuario_id => 7, :setor_id => 14
    UsuarioSetor.create :usuario_id => 7, :setor_id => 15
    UsuarioSetor.create :usuario_id => 7, :setor_id => 16
    UsuarioSetor.create :usuario_id => 7, :setor_id => 17
    UsuarioSetor.create :usuario_id => 7, :setor_id => 18
    UsuarioSetor.create :usuario_id => 7, :setor_id => 19
    UsuarioSetor.create :usuario_id => 7, :setor_id => 20
  end
end
