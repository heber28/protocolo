require 'test_helper'

class CepsControllerTest < ActionController::TestCase
  setup do
    @cep = ceps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cep" do
    assert_difference('Cep.count') do
      post :create, cep: {bairro: @cep.bairro, cep: @cep.cep, cidade: @cep.cidade, endereco: @cep.endereco, uf: @cep.uf}
    end

    assert_redirected_to cep_path(assigns(:cep))
  end

  test "should show cep" do
    get :show, id: @cep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cep
    assert_response :success
  end

  test "should update cep" do
    put :update, id: @cep, cep: {bairro: @cep.bairro, cep: @cep.cep, cidade: @cep.cidade, endereco: @cep.endereco, uf: @cep.uf}
    assert_redirected_to cep_path(assigns(:cep))
  end

  test "should destroy cep" do
    assert_difference('Cep.count', -1) do
      delete :destroy, id: @cep
    end

    assert_redirected_to ceps_path
  end
end
