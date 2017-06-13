require 'rails_helper'

RSpec.describe "User edits a job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Artist"
    fill_in "job[description]", with: "Not fun!"
    fill_in "job[level_of_interest]", with: 20
    fill_in "job[city]", with: "Perth"
    
    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Artist")
    expect(page).to have_content("20")
    expect(page).to have_content("Perth")
  end
end
