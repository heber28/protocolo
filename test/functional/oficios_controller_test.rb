require 'test_helper'

class OficiosControllerTest < ActionController::TestCase
  setup do
    @oficio = oficios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oficios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oficio" do
    assert_difference('Oficio.count') do
      post :create, oficio: {assunto: @oficio.assunto, destino: @oficio.destino, num_protocolo: @oficio.num_protocolo, observacao: @oficio.observacao, tipo: @oficio.tipo}
    end

    assert_redirected_to oficio_path(assigns(:oficio))
  end

  test "should show oficio" do
    get :show, id: @oficio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oficio
    assert_response :success
  end

  test "should update oficio" do
    put :update, id: @oficio, oficio: {assunto: @oficio.assunto, destino: @oficio.destino, num_protocolo: @oficio.num_protocolo, observacao: @oficio.observacao, tipo: @oficio.tipo}
    assert_redirected_to oficio_path(assigns(:oficio))
  end

  test "should destroy oficio" do
    assert_difference('Oficio.count', -1) do
      delete :destroy, id: @oficio
    end

    assert_redirected_to oficios_path
  end
end
