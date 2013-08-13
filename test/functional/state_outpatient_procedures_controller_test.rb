require 'test_helper'

class StateOutpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => StateOutpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    StateOutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    StateOutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to state_outpatient_procedure_url(assigns(:state_outpatient_procedure))
  end

  def test_edit
    get :edit, :id => StateOutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    StateOutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => StateOutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    StateOutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => StateOutpatientProcedure.first
    assert_redirected_to state_outpatient_procedure_url(assigns(:state_outpatient_procedure))
  end

  def test_destroy
    state_outpatient_procedure = StateOutpatientProcedure.first
    delete :destroy, :id => state_outpatient_procedure
    assert_redirected_to state_outpatient_procedures_url
    assert !StateOutpatientProcedure.exists?(state_outpatient_procedure.id)
  end
end
