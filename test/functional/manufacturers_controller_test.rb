require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_manufacturer
    assert_difference('Manufacturer.count') do
      post :create, :manufacturer => { }
    end

    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  def test_should_show_manufacturer
    get :show, :id => manufacturers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => manufacturers(:one).id
    assert_response :success
  end

  def test_should_update_manufacturer
    put :update, :id => manufacturers(:one).id, :manufacturer => { }
    assert_redirected_to manufacturer_path(assigns(:manufacturer))
  end

  def test_should_destroy_manufacturer
    assert_difference('Manufacturer.count', -1) do
      delete :destroy, :id => manufacturers(:one).id
    end

    assert_redirected_to manufacturers_path
  end
end
