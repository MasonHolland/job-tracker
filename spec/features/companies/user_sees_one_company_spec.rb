require 'rails_helper'

RSpec.describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Contacts")
  end

  scenario "contact form is present and can be submitted" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    click_link "Add New Contact"

    fill_in "contact[name]", with: "Patty Wu"
    fill_in "contact[email]", with: "PattyLuvYou@bjmail.cn"
    fill_in "contact[position]", with: "Hiring Manager"
    click_button "Create Contact"
    save_and_open_page
    
    expect(page).to have_content("Patty Wu")
    expect(page).to have_content("PattyLuvYou@bjmail.cn")
    expect(page).to have_content("Hiring Manager")
  end
end
