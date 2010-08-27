require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  test "should get index" do
    UserSession.create(users(:one))
    get :index, :user_id => users(:one).to_param
    assert_response :success
    assert_not_nil assigns(:relationships)
  end

  test "should get new" do
    UserSession.create(users(:one))
    get :new, :user_id => users(:one).to_param
    assert_response :success
  end

  test "should create relationship" do
    UserSession.create(users(:one))

    assert_difference('Relationship.count') do
      post :create, {:relationship => relationships(:one).attributes, :user_id => users(:one).to_param, :with_user_id => users(:ben).to_param}
    end

    assert_response :redirect
  end

  test "should show relationship" do
    UserSession.create(users(:one))
    get :show, :id => relationships(:one).to_param, :user_id => users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    UserSession.create(users(:one))
    get :edit, :id => relationships(:one).to_param, :user_id => users(:one).to_param
    assert_response :success
  end

  test "should update relationship" do
    UserSession.create(users(:one))
    put :update, :id => relationships(:one).to_param, :relationship => relationships(:one).attributes, :user_id => users(:one).to_param
    assert_response :redirect
  end

  test "should destroy relationship" do
    UserSession.create(users(:one))
    assert_difference('Relationship.count', -1) do
      delete :destroy, :id => relationships(:one).to_param, :user_id => users(:one).to_param
    end

    assert_response :redirect
  end
end
