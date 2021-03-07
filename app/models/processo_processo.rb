class ProcessoProcesso < ActiveRecord::Base
  attr_accessible :processo_id, :processo_id_vinculado

  belongs_to :processo
  belongs_to :processo_vinculado, :class_name => "Processo"
end
