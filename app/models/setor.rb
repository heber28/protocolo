# encoding: utf-8
class Setor < ActiveRecord::Base
  has_many :processos
  has_many :tramites
  has_many :usuarios
  has_many :usuario_setores
  attr_accessible :nome
  validates :nome, :presence => true
  before_save :antes_de_salvar

  def antes_de_salvar
    self.nome = ApplicationController.helpers.formatar(nome)
  end
end
