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
    Setor.create :nome => 'Coordenadoria Financeira' # 9
    Setor.create :nome => 'Defesa da Autuação' # 10
    Setor.create :nome => 'Diretoria Administrativa/Financeira' # 11
    Setor.create :nome => 'Diretoria de Operações' # 12
    Setor.create :nome => 'Diretoria de Trânsito' # 13
    Setor.create :nome => 'Fiscalização Eletrônica' # 14
    Setor.create :nome => 'Gerencia de Fiscalização de Postura' # 15
    Setor.create :nome => 'Gerencia de Fiscalização de Trânsito' # 16
    Setor.create :nome => 'Junda Admin de Recursos de Infrações' # 17
    Setor.create :nome => 'Licitação' # 18
    Setor.create :nome => 'Processamento de Multas' # 19
    Setor.create :nome => 'Protocolo de Multas' # 20
  end
end
