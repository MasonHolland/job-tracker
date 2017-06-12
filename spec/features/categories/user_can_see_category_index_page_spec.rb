require 'rails_helper'

RSpec.describe "User can view an index of categories" do
  it "links to delete and edit are present" do
    category = Category.create(title: "Fun")

    visit categories_path

    expect(current_path).to eq("/categories")
    expect(page).to have_content("Fun")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end

  it "links to correct page" do
    category = Category.create(title: "Fun")

    visit categories_path

    click_on "Edit"

    expect(current_path).to eq("/categories/#{category.id}/edit")

    visit categories_path

    click_on "Delete"

    expect(current_path).to eq("/categories")
  end
end
