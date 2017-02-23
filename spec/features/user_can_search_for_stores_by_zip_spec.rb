require 'rails_helper'

describe "When a user user visits the root path" do
  scenario "they can search for store by zip" do
    visit root_path

    fill_in :q, :with => "80202"

    click_on "search"

    expect(page).to have_content "16 Total Stores"
    expect(page).to have_selector('.store', count: 10)
    within(".store", match: :first) do
      expect(page).to have_content "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER"
      expect(page).to have_content "City: DENVER"
      expect(page).to have_content "Distance: 3.45"
      expect(page).to have_content "Phone number: 303-270-9189"
      expect(page).to have_content "Store type: Mobile SAS"
    end
  end
end