require 'test_helper'

class ProviderOutpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProviderOutpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProviderOutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProviderOutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to provider_outpatient_procedure_url(assigns(:provider_outpatient_procedure))
  end

  def test_edit
    get :edit, :id => ProviderOutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProviderOutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProviderOutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    ProviderOutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProviderOutpatientProcedure.first
    assert_redirected_to provider_outpatient_procedure_url(assigns(:provider_outpatient_procedure))
  end

  def test_destroy
    provider_outpatient_procedure = ProviderOutpatientProcedure.first
    delete :destroy, :id => provider_outpatient_procedure
    assert_redirected_to provider_outpatient_procedures_url
    assert !ProviderOutpatientProcedure.exists?(provider_outpatient_procedure.id)
  end
end
