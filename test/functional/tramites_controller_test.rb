require 'test_helper'

class TramitesControllerTest < ActionController::TestCase
  setup do
    @tramite = tramites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tramites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tramite" do
    assert_difference('Tramite.count') do
      post :create, tramite: {processo_id: @tramite.processo_id, setor_id: @tramite.setor_id, usuario_id: @tramite.usuario_id}
    end

    assert_redirected_to tramite_path(assigns(:tramite))
  end

  test "should show tramite" do
    get :show, id: @tramite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tramite
    assert_response :success
  end

  test "should update tramite" do
    put :update, id: @tramite, tramite: {processo_id: @tramite.processo_id, setor_id: @tramite.setor_id, usuario_id: @tramite.usuario_id}
    assert_redirected_to tramite_path(assigns(:tramite))
  end

  test "should destroy tramite" do
    assert_difference('Tramite.count', -1) do
      delete :destroy, id: @tramite
    end

    assert_redirected_to tramites_path
  end
end
