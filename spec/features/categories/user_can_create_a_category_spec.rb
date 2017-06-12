require 'rails_helper'

RSpec.describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Fun"
    click_button "Create"

    expect(current_path).to eq("/categories")
    
    expect(page).to have_content("Fun")
    expect(Category.count).to eq(1)
  end
end
