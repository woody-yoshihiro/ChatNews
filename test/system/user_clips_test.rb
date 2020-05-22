require "application_system_test_case"

class UserClipsTest < ApplicationSystemTestCase
  setup do
    @user_clip = user_clips(:one)
  end

  test "visiting the index" do
    visit user_clips_url
    assert_selector "h1", text: "User Clips"
  end

  test "creating a User clip" do
    visit user_clips_url
    click_on "New User Clip"

    fill_in "Clip", with: @user_clip.clip_id
    fill_in "User", with: @user_clip.user_id
    click_on "Create User clip"

    assert_text "User clip was successfully created"
    click_on "Back"
  end

  test "updating a User clip" do
    visit user_clips_url
    click_on "Edit", match: :first

    fill_in "Clip", with: @user_clip.clip_id
    fill_in "User", with: @user_clip.user_id
    click_on "Update User clip"

    assert_text "User clip was successfully updated"
    click_on "Back"
  end

  test "destroying a User clip" do
    visit user_clips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User clip was successfully destroyed"
  end
end
