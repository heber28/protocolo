class Arquivo < ActiveRecord::Base
  attr_accessible :arquivo, :processo_id
  belongs_to :processo
  mount_uploader :arquivo, ArquivoUploader

  def nome
    File.basename(arquivo.path || arquivo.filename) if arquivo
  end

  def nome_arquivo
    if arquivo.path.nil?
      ""
    else
      File.basename(arquivo.path)
    end
  end

end
