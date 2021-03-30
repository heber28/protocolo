require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  setup do
    @usuario1 = usuarios(:one)
    @usuario2 = usuarios(:two)
    @setor1 = setores(:one)
    session[:usuario_id] = @usuario1.id
    session[:setor_id] = @setor1.id
  end

  #test "login with invalid information" do
  #  get login_path
  #  assert_template 'sessions/new'
  #  post login_path, session: { login: "", password: "" }
  #  assert_template 'sessions/new'
  #  assert_not flash.empty?
  #  get root_path
  #  assert flash.empty?
  #end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post :create, usuario: {administrador: false, autor: true, password: 'P@ssw0rd1', password_confirmation: 'P@ssw0rd1', login: 'teste', 
                              nome: 'Teste', desativado: false, pode_alterar_setor: true}
    end

    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should show usuario" do
    get :show, id: @usuario1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario1
    assert_response :success
  end

  test "should update usuario" do
    put :update, id: @usuario1.id, usuario: {administrador: true, autor: true, password: 'P@ssw0rd1', password_confirmation: 'P@ssw0rd1', login: 'admin2',
                              nome: 'Admin2', desativado: false, pode_alterar_setor: true}
    assert_redirected_to usuario_path(assigns(:usuario))
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      @usuario5= usuarios(:five)
      delete :destroy, id: @usuario5
    end

    assert_redirected_to usuarios_path
  end
end
