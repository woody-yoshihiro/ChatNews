require "application_system_test_case"

class ClipsTest < ApplicationSystemTestCase
  setup do
    @clip = clips(:one)
  end

  test "visiting the index" do
    visit clips_url
    assert_selector "h1", text: "Clips"
  end

  test "creating a Clip" do
    visit clips_url
    click_on "New Clip"

    fill_in "Description", with: @clip.description
    fill_in "Image", with: @clip.image
    fill_in "Title", with: @clip.title
    fill_in "Url", with: @clip.url
    click_on "Create Clip"

    assert_text "Clip was successfully created"
    click_on "Back"
  end

  test "updating a Clip" do
    visit clips_url
    click_on "Edit", match: :first

    fill_in "Description", with: @clip.description
    fill_in "Image", with: @clip.image
    fill_in "Title", with: @clip.title
    fill_in "Url", with: @clip.url
    click_on "Update Clip"

    assert_text "Clip was successfully updated"
    click_on "Back"
  end

  test "destroying a Clip" do
    visit clips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clip was successfully destroyed"
  end
end
