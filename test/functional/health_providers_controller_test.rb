require 'test_helper'

class HealthProvidersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => HealthProvider.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    HealthProvider.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    HealthProvider.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to health_provider_url(assigns(:health_provider))
  end

  def test_edit
    get :edit, :id => HealthProvider.first
    assert_template 'edit'
  end

  def test_update_invalid
    HealthProvider.any_instance.stubs(:valid?).returns(false)
    put :update, :id => HealthProvider.first
    assert_template 'edit'
  end

  def test_update_valid
    HealthProvider.any_instance.stubs(:valid?).returns(true)
    put :update, :id => HealthProvider.first
    assert_redirected_to health_provider_url(assigns(:health_provider))
  end

  def test_destroy
    health_provider = HealthProvider.first
    delete :destroy, :id => health_provider
    assert_redirected_to health_providers_url
    assert !HealthProvider.exists?(health_provider.id)
  end
end
