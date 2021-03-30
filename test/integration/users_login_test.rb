require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login com informacoes invalidas" do
    get login_path
    assert_template 'sessions/new'
    post sessions_path, session: { usuario: "", password: "", setor: "" }
    assert_template 'sessions/new'
    assert_equal 'Usuário ou senha incorreta', flash[:alert]
  end

end
