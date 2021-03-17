# encoding: utf-8
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :descricao

      t.timestamps
    end
    Tag.create :descricao => 'IDENTIFICACAO DO CONDUTOR'
    Tag.create :descricao => 'DEFESA DA AUTUACAO'
    Tag.create :descricao => 'RECURSO JARI'
    Tag.create :descricao => 'RECURSO CETRAN'
    Tag.create :descricao => 'PROCESSO JUDICIAL'
    Tag.create :descricao => 'REGULARIZACAO'
    Tag.create :descricao => 'ADENDO'
    Tag.create :descricao => 'RESTITUICAO'
    Tag.create :descricao => 'ADMINISTRATIVO'
    Tag.create :descricao => 'SOLICITACAO DE COPIA'
    Tag.create :descricao => 'DESVINCULACAO'
    Tag.create :descricao => 'CNH'
    Tag.create :descricao => 'EXECUCAO JUDICIAL'
    Tag.create :descricao => 'DIVIDA ATIVA'
    Tag.create :descricao => 'RENAINF'
    Tag.create :descricao => 'AUDITORIA'
    Tag.create :descricao => 'RECURSO DEFESA - SUSPENSAO'
    Tag.create :descricao => 'RECURSO JARI - SUSPENSAO'
    Tag.create :descricao => 'RECURSO CETRAN - SUSPENSAO'
    Tag.create :descricao => 'RECURSO DEFESA - CASSACAO'
    Tag.create :descricao => 'RECURSO JARI - CASSACAO'
    Tag.create :descricao => 'RECURSO CETRAN - CASSACAO'
    Tag.create :descricao => 'PERMISSIONARIO PENALIZADO'
    Tag.create :descricao => 'ADENDO CNH'
  end
end
