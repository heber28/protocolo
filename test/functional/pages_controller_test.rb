require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get inicial" do
    get :inicial
    assert_response :success
  end

end
