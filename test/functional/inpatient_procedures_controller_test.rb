require 'test_helper'

class InpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => InpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    InpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    InpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to inpatient_procedure_url(assigns(:inpatient_procedure))
  end

  def test_edit
    get :edit, :id => InpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    InpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => InpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    InpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => InpatientProcedure.first
    assert_redirected_to inpatient_procedure_url(assigns(:inpatient_procedure))
  end

  def test_destroy
    inpatient_procedure = InpatientProcedure.first
    delete :destroy, :id => inpatient_procedure
    assert_redirected_to inpatient_procedures_url
    assert !InpatientProcedure.exists?(inpatient_procedure.id)
  end
end
