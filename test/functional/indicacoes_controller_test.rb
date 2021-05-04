require 'test_helper'

class IndicacoesControllerTest < ActionController::TestCase
  setup do
    @indicacao = indicacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicacao" do
    assert_difference('Indicacao.count') do
      post :create, indicacao: { arquivo_contrato_responsabilidade: @indicacao.arquivo_contrato_responsabilidade, arquivo_contrato_social: @indicacao.arquivo_contrato_social, arquivo_doc_condutor: @indicacao.arquivo_doc_condutor, arquivo_doc_proprietario: @indicacao.arquivo_doc_proprietario, arquivo_procuracao: @indicacao.arquivo_procuracao, cnh_condutor: @indicacao.cnh_condutor, cnh_proprietario: @indicacao.cnh_proprietario, numero_auto_infracao: @indicacao.numero_auto_infracao }
    end

    assert_redirected_to indicacao_path(assigns(:indicacao))
  end

  test "should show indicacao" do
    get :show, id: @indicacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicacao
    assert_response :success
  end

  test "should update indicacao" do
    put :update, id: @indicacao, indicacao: { arquivo_contrato_responsabilidade: @indicacao.arquivo_contrato_responsabilidade, arquivo_contrato_social: @indicacao.arquivo_contrato_social, arquivo_doc_condutor: @indicacao.arquivo_doc_condutor, arquivo_doc_proprietario: @indicacao.arquivo_doc_proprietario, arquivo_procuracao: @indicacao.arquivo_procuracao, cnh_condutor: @indicacao.cnh_condutor, cnh_proprietario: @indicacao.cnh_proprietario, numero_auto_infracao: @indicacao.numero_auto_infracao }
    assert_redirected_to indicacao_path(assigns(:indicacao))
  end

  test "should destroy indicacao" do
    assert_difference('Indicacao.count', -1) do
      delete :destroy, id: @indicacao
    end

    assert_redirected_to indicacoes_path
  end
end
