class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
      t.string :numero_auto_infracao
      t.string :email_para_retorno
      t.string :arquivo_notificacao
      t.string :arquivo_recurso
      t.string :arquivo_cnh
      t.string :arquivo_crlv
      t.string :arquivo_procuracao

      t.timestamps
    end
  end
end
