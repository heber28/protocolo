require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login com informacoes invalidas" do
    get login_path
    assert_template 'sessions/new'
    post sessions_path, session: { login: "", password: "" }
    assert_template 'sessions/new'
    assert_false flash.empty?
    get root_path
    assert flash.empty?
  end
end
