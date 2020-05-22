require 'test_helper'

class UserClipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_clip = user_clips(:one)
  end

  test "should get index" do
    get user_clips_url
    assert_response :success
  end

  test "should get new" do
    get new_user_clip_url
    assert_response :success
  end

  test "should create user_clip" do
    assert_difference('UserClip.count') do
      post user_clips_url, params: { user_clip: { clip_id: @user_clip.clip_id, user_id: @user_clip.user_id } }
    end

    assert_redirected_to user_clip_url(UserClip.last)
  end

  test "should show user_clip" do
    get user_clip_url(@user_clip)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_clip_url(@user_clip)
    assert_response :success
  end

  test "should update user_clip" do
    patch user_clip_url(@user_clip), params: { user_clip: { clip_id: @user_clip.clip_id, user_id: @user_clip.user_id } }
    assert_redirected_to user_clip_url(@user_clip)
  end

  test "should destroy user_clip" do
    assert_difference('UserClip.count', -1) do
      delete user_clip_url(@user_clip)
    end

    assert_redirected_to user_clips_url
  end
end
