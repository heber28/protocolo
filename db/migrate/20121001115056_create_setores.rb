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
    Setor.create :nome => 'Assessoria Juridica Dir de Trânsito' # 4
    Setor.create :nome => 'Contabilidade' # 5
    Setor.create :nome => 'Coordenadoria de Multas' # 6
    Setor.create :nome => 'Coordenadoria de Sistema Viário' # 7
    Setor.create :nome => 'Coordenadoria de Trânsito' # 8
    Setor.create :nome => 'Coordenadoria de Trânsito e Postura' # 9
    Setor.create :nome => 'Coordenadoria Financeira' # 10
    Setor.create :nome => 'Defesa da Autuação' # 11
    Setor.create :nome => 'Diretoria Administrativa/Financeira' # 12
    Setor.create :nome => 'Diretoria de Operações' # 13
    Setor.create :nome => 'Diretoria de Trânsito' # 14
    Setor.create :nome => 'Fiscalização Eletrônica' # 15
    Setor.create :nome => 'Gerencia de Fiscalização de Postura' # 16
    Setor.create :nome => 'Gerencia de Fiscalização de Trânsito' # 17
    Setor.create :nome => 'Junda Admin de Recursos de Infrações' # 18
    Setor.create :nome => 'Licitação' # 19
    Setor.create :nome => 'Processamento de Multas' # 20
    Setor.create :nome => 'Protocolo de Multas' # 21
  end
end
