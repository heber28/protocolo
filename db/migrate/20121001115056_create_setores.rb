# encoding: utf-8
class CreateSetores < ActiveRecord::Migration
  def change
    create_table :setores do |t|
      t.string :nome

      t.timestamps
    end
    Setor.create :nome => 'APOIO JARI' # 1
    Setor.create :nome => 'ARQUIVO GERAL' # 2
    Setor.create :nome => 'ASSESSORIA JURIDICA' # 3
    Setor.create :nome => 'ASSESSORIA JURIDICA DIR DE TRANSITO' # 4
    Setor.create :nome => 'CONTABILIDADE' # 5
    Setor.create :nome => 'COORDENADORIA DE MULTAS' # 6
    Setor.create :nome => 'COORDENADORIA DE SISTEMA VIARIO' # 7
    Setor.create :nome => 'COORDENADORIA DE TRANSITO' # 8
    Setor.create :nome => 'COORDENADORIA FINANCEIRA' # 9
    Setor.create :nome => 'DEFESA DA AUTUACAO' # 10
    Setor.create :nome => 'DIRETORIA ADMINISTRATIVA/FINANCEIRA' # 11
    Setor.create :nome => 'DIRETORIA DE OPERACOES' # 12
    Setor.create :nome => 'DIRETORIA DE TRANSITO' # 13
    Setor.create :nome => 'FISCALIZACAO ELETRONICA' # 14
    Setor.create :nome => 'GERENCIA DE FISCALIZACAO DE POSTURA' # 15
    Setor.create :nome => 'GERENCIA DE FISCALIZACAO DE TRANSITO' # 16
    Setor.create :nome => 'JUNTA ADMIN DE REUCRSOS DE INFRACOES' # 17
    Setor.create :nome => 'LICITACAO' # 18
    Setor.create :nome => 'PROCESSAMENTO DE MULTAS' # 19
    Setor.create :nome => 'PROTOCOLO DE MULTAS' # 20
  end
end
