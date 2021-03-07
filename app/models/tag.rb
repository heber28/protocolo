class Tag < ActiveRecord::Base
  has_many :processo_tag
  attr_accessible :descricao
  before_destroy :checar_processos
  validates :descricao, :presence => true

  private

  def checar_processos
    return false if processo_tag.size > 0
  end
end
