require 'test_helper'

class OutpatientProceduresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OutpatientProcedure.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to outpatient_procedure_url(assigns(:outpatient_procedure))
  end

  def test_edit
    get :edit, :id => OutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_invalid
    OutpatientProcedure.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OutpatientProcedure.first
    assert_template 'edit'
  end

  def test_update_valid
    OutpatientProcedure.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OutpatientProcedure.first
    assert_redirected_to outpatient_procedure_url(assigns(:outpatient_procedure))
  end

  def test_destroy
    outpatient_procedure = OutpatientProcedure.first
    delete :destroy, :id => outpatient_procedure
    assert_redirected_to outpatient_procedures_url
    assert !OutpatientProcedure.exists?(outpatient_procedure.id)
  end
end
