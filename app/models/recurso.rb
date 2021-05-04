class Recurso < ActiveRecord::Base
  attr_accessible :arquivo_cnh, :arquivo_crlv, :arquivo_notificacao, :arquivo_procuracao, :arquivo_recurso, :email_para_retorno, :numero_auto_infracao

  mount_uploader :arquivo_cnh, CnhUploader
  mount_uploader :arquivo_notificacao, NotificacaoUploader
  mount_uploader :arquivo_recurso, RecursoUploader
  mount_uploader :arquivo_crlv, CrlvUploader
  mount_uploader :arquivo_procuracao, ProcuracaoUploader

  def cnh
    if arquivo_cnh.blank?
      ''
    else
      File.basename(arquivo_cnh.path || arquivo_cnh.filename)
    end
  end

  def notificacao
    if arquivo_notificacao.blank?
      ''
    else
      File.basename(arquivo_notificacao.path || arquivo_notificacao.filename)
    end
  end

  def recurso
    if arquivo_recurso.blank?
      ''
    else
      File.basename(arquivo_recurso.path || arquivo_recurso.filename)
    end
  end

  def crlv
    if arquivo_crlv.blank?
      ''
    else
      File.basename(arquivo_crlv.path || arquivo_crlv.filename)
    end
  end

  def procuracao
    if arquivo_procuracao.blank?
      ''
    else
      File.basename(arquivo_procuracao.path || arquivo_procuracao.filename)
    end
  end

end
