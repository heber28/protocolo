require 'test_helper'

class SetoresControllerTest < ActionController::TestCase
  setup do
    @setor = setores(:one)
    @usuario1 = usuarios(:one)
    @setor1 = setores(:one)
    session[:usuario_id] = @usuario1.id
    session[:setor_id] = @setor1.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:setores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setor" do
    assert_difference('Setor.count') do
      post :create, setor: {nome: @setor.nome}
    end

    assert_redirected_to setor_path(assigns(:setor))
  end

  test "should show setor" do
    get :show, id: @setor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setor
    assert_response :success
  end

  test "should update setor" do
    put :update, id: @setor, setor: {nome: @setor.nome}
    assert_redirected_to setor_path(assigns(:setor))
  end

  test "should destroy setor" do
    assert_difference('Setor.count', -1) do
      delete :destroy, id: @setor
    end

    assert_redirected_to setores_path
  end
end
