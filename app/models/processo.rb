# encoding: utf-8
class Processo < ActiveRecord::Base
  belongs_to :setor
  belongs_to :usuario
  has_many :comentarios
  has_many :tramites
  has_many :processo_tags
  has_many :tags, through: :processo_tags
  has_many :arquivos
  attr_accessible :descricao, :numero_protocolo, :setor_id, :setor_id_atual, :usuario_id, :created_at, :comentarios_attributes, :tramites_attributes, :tag_ids, :tag_tokens, :data_tramite, :nome, :cpf, :cnpj, :arquivos_attributes
  attr_reader :tag_tokens
  accepts_nested_attributes_for :comentarios, allow_destroy: true
  accepts_nested_attributes_for :tramites, allow_destroy: true
  accepts_nested_attributes_for :arquivos, allow_destroy: true
  #validates_presence_of :descricao, :message => "A descrição precisa ser preenchida"

  before_destroy :checar_tramite
  before_destroy :checar_comentario

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

  def self.procurar(p, page)
    sql = 'processos.id is not null'
    sql += ' and processos.setor_id_atual = ?' if !p[:setor_id].blank?
    sql += ' and processo_tags.tag_id = ?' if !p[:tag_id].blank?
    sql += ' and processos.numero_protocolo = ?' if !p[:numero_protocolo].blank?
    sql += ' and processos.cpf = ?' if !p[:cpf].blank?
    sql += ' and processos.cnpj = ?' if !p[:cnpj].blank?
    sql += ' and processos.created_at >= ?' if !p[:dt_cini].blank?
    sql += ' and processos.created_at <= ?' if !p[:dt_cfim].blank?
    sql += ' and processos.updated_at >= ?' if !p[:dt_tini].blank?
    sql += ' and processos.updated_at <= ?' if !p[:dt_tfim].blank?
    sql += ' and processos.descricao like ?' if !p[:descricao].blank?
    conditions = [sql]
    conditions << p[:setor_id] if !p[:setor_id].blank?
    conditions << p[:tag_id] if !p[:tag_id].blank?
    conditions << p[:numero_protocolo] if !p[:numero_protocolo].blank?
    conditions << p[:cpf] if !p[:cpf].blank?
    conditions << p[:cnpj] if !p[:cnpj].blank?
    conditions << "%#{p[:nome]}%" if !p[:nome].blank?
    conditions << "#{p[:dt_cini]}" if !p[:dt_cini].blank?
    conditions << "#{p[:dt_cfim]}" if !p[:dt_cfim].blank?
    conditions << "#{p[:dt_tini]}" if !p[:dt_tini].blank?
    conditions << "#{p[:dt_tfim]}" if !p[:dt_tfim].blank?
    conditions << "%#{p[:descricao]}%" if !p[:descricao].blank?
    if p[:tag_id] == '' then
      paginate :per_page => 10, :page => page,
               :conditions => conditions,
               :order => ['data_tramite DESC']
    else
      paginate :per_page => 10, :page => page,
               :joins => :processo_tags,
               :conditions => conditions,
               :order => ['data_tramite DESC']
    end
  end

  def self.buscar(busca, page)
    paginate :per_page => 10, :page => page,
             :conditions => ["id like ? or numero_protocolo like ? or descricao like ?", "%#{busca}%", "%#{busca}%", "%#{busca}%"],
             :order => ['id DESC']
  end

  def lista_tags
    arr = []
    processo_tags.each do |item|
      arr.push(item.tag.descricao)
    end
    arr.to_sentence
  end

  private

  def checar_tramite
    if tramites.size > 0
      self.errors[:tramites] << "Não é possível excluir o processo enquanto existir trâmites neste processo"
      return false
    end
  end

  def checar_comentario
    if comentarios.size > 0
      self.errors[:comentarios] << "Não é possível excluir o processo enquanto existir comentários neste processo"
      return false
    end
  end

end
