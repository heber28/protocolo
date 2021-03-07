require 'test_helper'

class MaosObraControllerTest < ActionController::TestCase
  setup do
    @mao_obra = maos_obra(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maos_obra)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mao_obra" do
    assert_difference('MaoObra.count') do
      post :create, mao_obra: {funcao: @mao_obra.funcao, funcionario: @mao_obra.funcionario, processo_id: @mao_obra.processo_id, qtd_horas: @mao_obra.qtd_horas}
    end

    assert_redirected_to mao_obra_path(assigns(:mao_obra))
  end

  test "should show mao_obra" do
    get :show, id: @mao_obra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mao_obra
    assert_response :success
  end

  test "should update mao_obra" do
    put :update, id: @mao_obra, mao_obra: {funcao: @mao_obra.funcao, funcionario: @mao_obra.funcionario, processo_id: @mao_obra.processo_id, qtd_horas: @mao_obra.qtd_horas}
    assert_redirected_to mao_obra_path(assigns(:mao_obra))
  end

  test "should destroy mao_obra" do
    assert_difference('MaoObra.count', -1) do
      delete :destroy, id: @mao_obra
    end

    assert_redirected_to maos_obra_path
  end
end
