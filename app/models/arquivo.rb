class Arquivo < ActiveRecord::Base
  attr_accessible :arquivo, :processo_id, :usuario_id
  belongs_to :processo
  belongs_to :usuario
  mount_uploader :arquivo, ArquivoUploader

  def nome
    File.basename(arquivo.path || arquivo.filename) if arquivo
  end

end
