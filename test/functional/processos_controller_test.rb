require 'test_helper'

class ProcessosControllerTest < ActionController::TestCase
  setup do
    @processo = processos(:one)
    @usuario1 = usuarios(:one)
    @setor1 = setores(:one)
    session[:usuario_id] = @usuario1.id
    session[:setor_id] = @setor1.id
    @current_user = @usuario1
    @current_setor = @setor1
  end

  test "should get index" do
    get :index, setor_id: @setor1.id
    assert_response :success
    assert_not_nil assigns(:processos)
  end

  test "should get new" do
    current_user = Usuario.find(@usuario1.id)
    current_setor = Setor.find(@setor1.id)
    get :new
    assert_response :success
  end

  test "should create processo" do
    assert_difference('Processo.count') do
      post :create, processo: {descricao: 'descricao...', usuario_id: @usuario1.id, setor_id: @setor1.id, nome: 'Carlos Alberto da Silva'}
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
    put :update, id: @processo, processo: {descricao: 'descricao...', usuario_id: @usuario1.id, setor_id: @setor1.id, nome: 'Aline Morais'}
    assert_redirected_to processo_path(assigns(:processo))
  end

  test "should destroy processo" do
    assert_difference('Processo.count', -1) do
      delete :destroy, id: @processo
    end

    assert_redirected_to processos_path
  end
end
