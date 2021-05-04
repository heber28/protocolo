class CreateIndicacoes < ActiveRecord::Migration
  def change
    create_table :indicacoes do |t|
      t.string :numero_auto_infracao
      t.string :arquivo_notificacao
      t.string :arquivo_cnh_condutor_infrator
      t.string :arquivo_doc_proprietario
      t.string :arquivo_contrato_social
      t.string :arquivo_procuracao
      t.string :arquivo_contrato_responsabilidade
      t.string :email_para_retorno

      t.timestamps
    end
  end
end
