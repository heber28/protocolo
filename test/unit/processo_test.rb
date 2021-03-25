require 'test_helper'

class ProcessoTest < ActiveSupport::TestCase
  test "nao salva sem o nome" do
    processo = Processo.new
    assert !processo.save
  end
end
