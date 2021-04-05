class AddAssuntoToProcessos < ActiveRecord::Migration
  def change
    add_column :processos, :assunto, :string
  end
end
