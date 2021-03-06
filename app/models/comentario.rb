# encoding: utf-8
class Comentario < ActiveRecord::Base
  belongs_to :processo
  belongs_to :usuario
  attr_accessible :descricao, :processo_id, :usuario_id, :created_at
  validates_presence_of :descricao, :message => "A descricao precisa ser preenchida"
  before_save :antes_de_salvar

  def antes_de_salvar
    self.descricao = ApplicationController.helpers.formatar(descricao)
  end
end
