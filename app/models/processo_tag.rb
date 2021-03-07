class ProcessoTag < ActiveRecord::Base
  attr_accessible :processo_id
  attr_accessible :tag_id
  belongs_to :processo
  belongs_to :tag
end
