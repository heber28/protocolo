require 'test_helper'

class PessoasControllerTest < ActionController::TestCase
  setup do
    @pessoa = pessoas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pessoas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference('Pessoa.count') do
      post :create, pessoa: {bairro: @pessoa.bairro, celular: @pessoa.celular, cep: @pessoa.cep, cidade: @pessoa.cidade, cnpj: @pessoa.cnpj, complemento: @pessoa.complemento, cpf: @pessoa.cpf, email: @pessoa.email, endereco: @pessoa.endereco, estado: @pessoa.estado, info_adicional: @pessoa.info_adicional, nome: @pessoa.nome, numero: @pessoa.numero, tel_comercial: @pessoa.tel_comercial, tel_residencial: @pessoa.tel_residencial}
    end

    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should show pessoa" do
    get :show, id: @pessoa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pessoa
    assert_response :success
  end

  test "should update pessoa" do
    put :update, id: @pessoa, pessoa: {bairro: @pessoa.bairro, celular: @pessoa.celular, cep: @pessoa.cep, cidade: @pessoa.cidade, cnpj: @pessoa.cnpj, complemento: @pessoa.complemento, cpf: @pessoa.cpf, email: @pessoa.email, endereco: @pessoa.endereco, estado: @pessoa.estado, info_adicional: @pessoa.info_adicional, nome: @pessoa.nome, numero: @pessoa.numero, tel_comercial: @pessoa.tel_comercial, tel_residencial: @pessoa.tel_residencial}
    assert_redirected_to pessoa_path(assigns(:pessoa))
  end

  test "should destroy pessoa" do
    assert_difference('Pessoa.count', -1) do
      delete :destroy, id: @pessoa
    end

    assert_redirected_to pessoas_path
  end
end
