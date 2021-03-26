require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "nao salva sem a descrição" do
    tag = Tag.new
    assert !tag.save
  end
end
