# encoding: utf-8
class Processo < ActiveRecord::Base
  belongs_to :setor
  belongs_to :usuario
  has_many :comentarios, :dependent => :delete_all
  has_many :tramites, :dependent => :delete_all
  has_many :anexos, :dependent => :delete_all
  attr_accessible :descricao, :numero_git, :setor_id, :setor_id_atual, :usuario_id, :created_at, :comentarios_attributes, :tramites_attributes, :data_tramite, :nome, :cpf, :cnpj, :assunto, :anexos_attributes
  accepts_nested_attributes_for :comentarios, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tramites, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :anexos, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :nome, :message => "O nome precisa ser preenchido"

  #before_destroy :checar_tramite
  #before_destroy :checar_comentario
  before_save :antes_de_salvar

  def antes_de_salvar
    self.nome = ApplicationController.helpers.formatar(nome)
    self.descricao = ApplicationController.helpers.formatar(descricao)
  end

  def self.procurar(p, page)
    sql = 'processos.id is not null'
    sql += ' and processos.setor_id_atual = ?' if !p[:setor_id].blank?
    sql += ' and processos.assunto = ?' if !p[:assunto].blank?
    sql += ' and processos.numero_git = ?' if !p[:numero_git].blank?
    sql += ' and processos.cpf = ?' if !p[:cpf].blank?
    sql += ' and processos.cnpj = ?' if !p[:cnpj].blank?
    sql += ' and processos.created_at >= ?' if !p[:dt_cini].blank?
    sql += ' and processos.created_at <= ?' if !p[:dt_cfim].blank?
    sql += ' and processos.updated_at >= ?' if !p[:dt_tini].blank?
    sql += ' and processos.updated_at <= ?' if !p[:dt_tfim].blank?
    sql += ' and processos.descricao like ?' if !p[:descricao].blank?
    conditions = [sql]
    conditions << p[:setor_id] if !p[:setor_id].blank?
    conditions << p[:assunto] if !p[:assunto].blank?
    conditions << p[:numero_git] if !p[:numero_git].blank?
    conditions << p[:cpf] if !p[:cpf].blank?
    conditions << p[:cnpj] if !p[:cnpj].blank?
    conditions << "%#{p[:nome]}%" if !p[:nome].blank?
    conditions << "#{p[:dt_cini]}" if !p[:dt_cini].blank?
    conditions << "#{p[:dt_cfim]}" if !p[:dt_cfim].blank?
    conditions << "#{p[:dt_tini]}" if !p[:dt_tini].blank?
    conditions << "#{p[:dt_tfim]}" if !p[:dt_tfim].blank?
    conditions << "%#{p[:descricao]}%" if !p[:descricao].blank?
    paginate :per_page => 10, :page => page,
               :conditions => conditions,
               :order => ['data_tramite DESC']
  end

  def self.buscar(busca, page)
    paginate :per_page => 10, :page => page,
             :conditions => ["id like ? or numero_git like ? or descricao like ?", "%#{busca}%", "%#{busca}%", "%#{busca}%"],
             :order => ['id DESC']
  end

  private

  def checar_tramite # n??o mais usado pois o delete vai ser cascade no processo
    if tramites.size > 0
      self.errors[:tramites] << "N??o ?? poss??vel excluir o processo enquanto existir tr??mites neste processo"
      return false
    end
  end

  def checar_comentario # n??o mais usado pois o delete vai ser cascade no processo
    if comentarios.size > 0
      self.errors[:comentarios] << "N??o ?? poss??vel excluir o processo enquanto existir coment??rios neste processo"
      return false
    end
  end

end
