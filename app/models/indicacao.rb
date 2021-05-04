class Indicacao < ActiveRecord::Base
  attr_accessible :arquivo_contrato_responsabilidade, :arquivo_contrato_social, :arquivo_doc_proprietario, :arquivo_procuracao, :arquivo_cnh_condutor_infrator, :arquivo_notificacao, :numero_auto_infracao, :email_para_retorno

  mount_uploader :arquivo_cnh_condutor_infrator, CnhCondutorInfratorUploader
  mount_uploader :arquivo_notificacao, NotificacaoUploader
  mount_uploader :arquivo_contrato_responsabilidade, ContratoResponsabilidadeUploader
  mount_uploader :arquivo_contrato_social, ContratoSocialUploader
  mount_uploader :arquivo_doc_proprietario, DocProprietarioUploader
  mount_uploader :arquivo_procuracao, ProcuracaoUploader

  def cnh_condutor_infrator
    if arquivo_cnh_condutor_infrator.blank?
      ''
    else
      File.basename(arquivo_cnh_condutor_infrator.path || arquivo_cnh_condutor_infrator.filename)
    end  
  end

  def notificacao
    if arquivo_notificacao.blank?
      ''
    else
      File.basename(arquivo_notificacao.path || arquivo_notificacao.filename)
    end
  end  
  
  def contrato_responsabilidade
    if arquivo_contrato_responsabilidade.blank?
      ''
    else
      File.basename(arquivo_contrato_responsabilidade.path || arquivo_contrato_responsabilidade.filename)
    end  
  end

  def contrato_social
    if arquivo_contrato_social.blank?
      ''
    else
      File.basename(arquivo_contrato_social.path || arquivo_contrato_social.filename)
    end
  end
  
  def doc_proprietario
    if arquivo_doc_proprietario.blank?
      ''
    else
      File.basename(arquivo_doc_proprietario.path || arquivo_doc_proprietario.filename)
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
