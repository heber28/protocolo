# encoding: utf-8
class Tramite < ActiveRecord::Base
  belongs_to :processo
  belongs_to :setor
  belongs_to :usuario
  attr_accessible :processo_id, :setor_id, :setor_id_anterior, :usuario_id, :created_at
  validates_presence_of :setor_id, :message => "O setor precisa ser selecionado"
  after_destroy :atualizar_setor
  private
  def atualizar_setor
    t = Tramite.where("processo_id = ?", self.processo_id).order("id DESC").first
    if t.nil? == false
      p = Processo.find_by_id(self.processo_id)
      p.setor_id_atual = t.setor_id
      p.data_tramite = Date.today
      p.save
    else
      p = Processo.find_by_id(self.processo_id)
      p.setor_id_atual = p.setor_id
      p.data_tramite = Date.today
      p.save
    end
  end
end
