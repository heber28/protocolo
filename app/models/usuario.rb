# encoding: utf-8
class Usuario < ActiveRecord::Base
  has_many :processos
  has_many :comentarios
  has_many :tramites
  has_many :arquivos
  belongs_to :setor
  has_many :usuario_setores
  has_secure_password
  attr_accessible :administrador, :autor, :login, :nome, :password, :password_confirmation, :desativado, :pode_alterar_setor, :usuario_setores_attributes, :senha
  validates_uniqueness_of :login
  validates :nome, :presence => true
  validates :login, :presence => true
  validates :password, :length => {:minimum => 6}
  validates :password, :length => {:minimum => 6}, :on => :create
  validates :password, :length => {:minimum => 6}, :on => :update, :unless => lambda { |user| user.password.blank? }
  validate :password_complexity
  accepts_nested_attributes_for :usuario_setores, allow_destroy: true
  before_save :antes_de_salvar
  before_destroy :checar_comentario

  def antes_de_salvar
    self.nome = ApplicationController.helpers.formatar(nome)
    self.login = login.downcase
  end


  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).+/)
      errors.add :password, "é necessário ter 6 caracteres, incluir pelo menos uma letra minúscula, uma letra maiúscula e um número"
    end
  end

  def generate_password(length=6)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
    password = ''
    length.times { |i| password << chars[rand(chars.length)] }
    password
  end

  def primeiro_nome
    nome.split(" ")[0]
  end

  def update_attributes(params)
    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
    end
    super params
  end

  private

  def checar_comentario
    comentarios = Comentario.where('usuario_id = ?', self.id)
    if comentarios.size > 0
      self.errors[:comentarios] << "Não é possível excluir pois existem comentários feitos por este usuário"
      return false
    end
  end

end
