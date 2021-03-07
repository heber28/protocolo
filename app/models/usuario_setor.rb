class UsuarioSetor < ActiveRecord::Base
  attr_accessible :setor_id, :usuario_id
  belongs_to :usuario
  belongs_to :setor
end
