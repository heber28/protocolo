require 'test_helper'

class ProcessosControllerTest < ActionController::TestCase
  setup do
    @processo = processos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processo" do
    assert_difference('Processo.count') do
      post :create, processo: {descricao: @processo.descricao, pessoa_id: @processo.pessoa_id, setor_id: @processo.setor_id, situacao: @processo.situacao, usuario_id: @processo.usuario_id}
    end

    assert_redirected_to processo_path(assigns(:processo))
  end

  test "should show processo" do
    get :show, id: @processo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processo
    assert_response :success
  end

  test "should update processo" do
    put :update, id: @processo, processo: {descricao: @processo.descricao, pessoa_id: @processo.pessoa_id, setor_id: @processo.setor_id, situacao: @processo.situacao, usuario_id: @processo.usuario_id}
    assert_redirected_to processo_path(assigns(:processo))
  end

  test "should destroy processo" do
    assert_difference('Processo.count', -1) do
      delete :destroy, id: @processo
    end

    assert_redirected_to processos_path
  end
end
