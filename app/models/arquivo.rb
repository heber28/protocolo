class Arquivo < ActiveRecord::Base
  attr_accessible :arquivo, :processo_id
  belongs_to :processo
  mount_uploader :arquivo, ArquivoUploader

  def nome
    File.basename(arquivo.path || arquivo.filename) if arquivo
  end

end
