# encoding: utf-8
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :descricao

      t.timestamps
    end
    Tag.create :descricao => 'Identificacao do Condutor'
    Tag.create :descricao => 'Defesa da Autuacao'
    Tag.create :descricao => 'Recurso Jari'
    Tag.create :descricao => 'Recurso Cetran'
    Tag.create :descricao => 'Processo Judicial'
    Tag.create :descricao => 'Regularizacao'
    Tag.create :descricao => 'Adendo'
    Tag.create :descricao => 'Restituicao'
    Tag.create :descricao => 'Administrativo'
    Tag.create :descricao => 'Solicitacao de Copia'
    Tag.create :descricao => 'Desvinculacao'
    Tag.create :descricao => 'CNH'
    Tag.create :descricao => 'Execucao Judicial'
    Tag.create :descricao => 'Divida Ativa'
    Tag.create :descricao => 'RENAINF'
    Tag.create :descricao => 'Auditoria'
    Tag.create :descricao => 'Recurso Defesa - Suspensao'
    Tag.create :descricao => 'Recurso Jari - Suspensao'
    Tag.create :descricao => 'Recurso Cetran - Suspensao'
    Tag.create :descricao => 'Recurso Defesa - Cassacao'
    Tag.create :descricao => 'Recurso Jari - Cassacao'
    Tag.create :descricao => 'Recurso Cetran - Cassacao'
    Tag.create :descricao => 'Permissionario Penalizado'
    Tag.create :descricao => 'Adendo CNH'
  end
end
