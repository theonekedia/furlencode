require 'test_helper'

class Stores::ReviewsControllerTest < ActionController::TestCase
  setup do
    @stores_review = stores_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stores_review" do
    assert_difference('Stores::Review.count') do
      post :create, stores_review: { critic: @stores_review.critic, liked: @stores_review.liked, store_id: @stores_review.store_id, user_id: @stores_review.user_id }
    end

    assert_redirected_to stores_review_path(assigns(:stores_review))
  end

  test "should show stores_review" do
    get :show, id: @stores_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stores_review
    assert_response :success
  end

  test "should update stores_review" do
    patch :update, id: @stores_review, stores_review: { critic: @stores_review.critic, liked: @stores_review.liked, store_id: @stores_review.store_id, user_id: @stores_review.user_id }
    assert_redirected_to stores_review_path(assigns(:stores_review))
  end

  test "should destroy stores_review" do
    assert_difference('Stores::Review.count', -1) do
      delete :destroy, id: @stores_review
    end

    assert_redirected_to stores_reviews_path
  end
end
