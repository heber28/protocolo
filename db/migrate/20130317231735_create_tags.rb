# encoding: utf-8
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :descricao

      t.timestamps
    end
    Tag.create :descricao => 'RESERVA DE VAGA'
    Tag.create :descricao => 'AMBULANTES'
    Tag.create :descricao => 'FISCALIZAÇÃO'
    Tag.create :descricao => 'MULTA DE POSTURA'
    Tag.create :descricao => 'TRÂNSITO'
    Tag.create :descricao => 'AUTORIZAÇÕES'
    Tag.create :descricao => 'FEIRAS'
    Tag.create :descricao => 'TRANSPORTE COLETIVO'
    Tag.create :descricao => 'FINANCEIRO'
    Tag.create :descricao => 'LICITAÇÃO'
    Tag.create :descricao => 'CAÇAMBA'
    Tag.create :descricao => 'BOLETO BANCÁRIO'
    Tag.create :descricao => 'COLETA'
    Tag.create :descricao => 'ENTULHOS'
    Tag.create :descricao => 'TAXI'
    Tag.create :descricao => 'CARGA E DESCARGA'
    Tag.create :descricao => 'PAGAMENTOS'
    Tag.create :descricao => 'OUTROS'
    Tag.create :descricao => 'SINALIZAÇÃO'
    Tag.create :descricao => 'CAPINA E ROÇAGEM'
    Tag.create :descricao => 'MOTO TÁXI'
    Tag.create :descricao => 'INTERDIÇÃO DE VIA'
    Tag.create :descricao => 'LIMPEZA'
    Tag.create :descricao => 'PONTO DE ÔNIBUS'
    Tag.create :descricao => 'TRANSPORTE DE ESCOLARES'
    Tag.create :descricao => 'PANFLETAGEM'
    Tag.create :descricao => 'TRANSPORTE ESPECIAL'
    Tag.create :descricao => 'CERTIDÃO NEGATIVA'
    Tag.create :descricao => 'NOTA FISCAL'
    Tag.create :descricao => 'TERRENOS'
    Tag.create :descricao => 'RECICLAGEM'
    Tag.create :descricao => 'RECLAMAÇÃO'
  end
end
