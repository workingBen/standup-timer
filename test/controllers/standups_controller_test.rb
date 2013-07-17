require 'test_helper'

class StandupsControllerTest < ActionController::TestCase
  setup do
    @standup = standups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standup" do
    assert_difference('Standup.count') do
      post :create, standup: { team_id: @standup.team_id }
    end

    assert_redirected_to standup_path(assigns(:standup))
  end

  test "should show standup" do
    get :show, id: @standup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standup
    assert_response :success
  end

  test "should update standup" do
    patch :update, id: @standup, standup: { team_id: @standup.team_id }
    assert_redirected_to standup_path(assigns(:standup))
  end

  test "should destroy standup" do
    assert_difference('Standup.count', -1) do
      delete :destroy, id: @standup
    end

    assert_redirected_to standups_path
  end
end
