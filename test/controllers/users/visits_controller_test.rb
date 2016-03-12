require 'test_helper'

class Users::VisitsControllerTest < ActionController::TestCase
  setup do
    @users_visit = users_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_visit" do
    assert_difference('Users::Visit.count') do
      post :create, users_visit: { date: @users_visit.date, status: @users_visit.status }
    end

    assert_redirected_to users_visit_path(assigns(:users_visit))
  end

  test "should show users_visit" do
    get :show, id: @users_visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_visit
    assert_response :success
  end

  test "should update users_visit" do
    patch :update, id: @users_visit, users_visit: { date: @users_visit.date, status: @users_visit.status }
    assert_redirected_to users_visit_path(assigns(:users_visit))
  end

  test "should destroy users_visit" do
    assert_difference('Users::Visit.count', -1) do
      delete :destroy, id: @users_visit
    end

    assert_redirected_to users_visits_path
  end
end
