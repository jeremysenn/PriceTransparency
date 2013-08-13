require 'test_helper'

class StateInpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => StateInpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    StateInpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    StateInpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to state_inpatient_procedure_url(assigns(:state_inpatient_procedure))
  end

  def test_edit
    get :edit, :id => StateInpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    StateInpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => StateInpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    StateInpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => StateInpatientProcedure.first
    assert_redirected_to state_inpatient_procedure_url(assigns(:state_inpatient_procedure))
  end

  def test_destroy
    state_inpatient_procedure = StateInpatientProcedure.first
    delete :destroy, :id => state_inpatient_procedure
    assert_redirected_to state_inpatient_procedures_url
    assert !StateInpatientProcedure.exists?(state_inpatient_procedure.id)
  end
end
