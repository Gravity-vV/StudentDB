require "application_system_test_case"

class MajorsTest < ApplicationSystemTestCase
  setup do
    @major = majors(:one)
  end

  test "visiting the index" do
    visit majors_url
    assert_selector "h1", text: "Majors"
  end

  test "creating a Major" do
    visit majors_url
    click_on "New Major"

    fill_in "Mno", with: @major.mno
    fill_in "Name", with: @major.name
    click_on "Create Major"

    assert_text "Major was successfully created"
    click_on "Back"
  end

  test "updating a Major" do
    visit majors_url
    click_on "Edit", match: :first

    fill_in "Mno", with: @major.mno
    fill_in "Name", with: @major.name
    click_on "Update Major"

    assert_text "Major was successfully updated"
    click_on "Back"
  end

  test "destroying a Major" do
    visit majors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Major was successfully destroyed"
  end
end
