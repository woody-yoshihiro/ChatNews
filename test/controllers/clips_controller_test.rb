require 'test_helper'

class ClipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clip = clips(:one)
  end

  test "should get index" do
    get clips_url
    assert_response :success
  end

  test "should get new" do
    get new_clip_url
    assert_response :success
  end

  test "should create clip" do
    assert_difference('Clip.count') do
      post clips_url, params: { clip: { description: @clip.description, image: @clip.image, title: @clip.title, url: @clip.url } }
    end

    assert_redirected_to clip_url(Clip.last)
  end

  test "should show clip" do
    get clip_url(@clip)
    assert_response :success
  end

  test "should get edit" do
    get edit_clip_url(@clip)
    assert_response :success
  end

  test "should update clip" do
    patch clip_url(@clip), params: { clip: { description: @clip.description, image: @clip.image, title: @clip.title, url: @clip.url } }
    assert_redirected_to clip_url(@clip)
  end

  test "should destroy clip" do
    assert_difference('Clip.count', -1) do
      delete clip_url(@clip)
    end

    assert_redirected_to clips_url
  end
end
