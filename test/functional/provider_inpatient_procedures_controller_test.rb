require 'test_helper'

class ProviderInpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProviderInpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProviderInpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProviderInpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to provider_inpatient_procedure_url(assigns(:provider_inpatient_procedure))
  end

  def test_edit
    get :edit, :id => ProviderInpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProviderInpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProviderInpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    ProviderInpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProviderInpatientProcedure.first
    assert_redirected_to provider_inpatient_procedure_url(assigns(:provider_inpatient_procedure))
  end

  def test_destroy
    provider_inpatient_procedure = ProviderInpatientProcedure.first
    delete :destroy, :id => provider_inpatient_procedure
    assert_redirected_to provider_inpatient_procedures_url
    assert !ProviderInpatientProcedure.exists?(provider_inpatient_procedure.id)
  end
end
