require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login com informacoes invalidas" do
    get login_path
    assert_template 'sessions/new'
    post sessions_path, usuario: "", password: "", setor: "" 
    assert_template 'sessions/new'
    assert_equal 'Usuário ou senha incorreta', flash[:alert]
  end

  test "login com informacoes validas" do
    get login_path
    assert_template 'sessions/new'
    #post sessions_path, usuario: "admin", password: "P@ssw0rd1", setor: "1" 
    post_via_redirect '/sessions', :usuario => usuarios(:one).login, :password => 'P@ssw0rd1', :setor => '1'
    assert_equal '/processos', path
    assert_equal 'Logado!', flash[:notice]
  end


end
