require 'test_helper'

class Trackers::EventsControllerTest < ActionController::TestCase
  setup do
    @trackers_event = trackers_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackers_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trackers_event" do
    assert_difference('Trackers::Event.count') do
      post :create, trackers_event: { event_name: @trackers_event.event_name, referrer: @trackers_event.referrer, tracker_id: @trackers_event.tracker_id, value: @trackers_event.value }
    end

    assert_redirected_to trackers_event_path(assigns(:trackers_event))
  end

  test "should show trackers_event" do
    get :show, id: @trackers_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trackers_event
    assert_response :success
  end

  test "should update trackers_event" do
    patch :update, id: @trackers_event, trackers_event: { event_name: @trackers_event.event_name, referrer: @trackers_event.referrer, tracker_id: @trackers_event.tracker_id, value: @trackers_event.value }
    assert_redirected_to trackers_event_path(assigns(:trackers_event))
  end

  test "should destroy trackers_event" do
    assert_difference('Trackers::Event.count', -1) do
      delete :destroy, id: @trackers_event
    end

    assert_redirected_to trackers_events_path
  end
end
