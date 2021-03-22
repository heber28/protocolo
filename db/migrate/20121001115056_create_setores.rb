# encoding: utf-8
class CreateSetores < ActiveRecord::Migration
  def change
    create_table :setores do |t|
      t.string :nome

      t.timestamps
    end
    Setor.create :nome => 'Apoio Jari' # 1
    Setor.create :nome => 'Arquivo Geral' # 2
    Setor.create :nome => 'Assessoria Juridica' # 3
    Setor.create :nome => 'Contabilidade' # 4
    Setor.create :nome => 'Coordenadoria de Multas' # 5
    Setor.create :nome => 'Coordenadoria de Sistema Viario' # 6
    Setor.create :nome => 'Coordenadoria de Transito' # 7
    Setor.create :nome => 'Coordenadoria Financeira' # 8
    Setor.create :nome => 'Defesa da Autuacao' # 9
    Setor.create :nome => 'Diretoria Administrativa/Financeira' # 10
    Setor.create :nome => 'Diretoria de Operacoes' # 11
    Setor.create :nome => 'Diretoria de Transito' # 12
    Setor.create :nome => 'Fiscalizacao Eletronica' # 13
    Setor.create :nome => 'Gerencia de Fiscalizacao de Postura' # 14
    Setor.create :nome => 'Gerencia de Fiscalizacao de Transito' # 15
    Setor.create :nome => 'Junta Admin de Recursos de Infracoes' # 16
    Setor.create :nome => 'Licitacao' # 17
    Setor.create :nome => 'Processamento de Multas' # 18
    Setor.create :nome => 'Protocolo de Multas' # 19
  end
end
