require 'rails_helper'

RSpec.describe "user can create a new comment" do
  it "is displayed on the jobs page" do
    company = Company.create!(name: "Dutch Boys Toys")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    click_on "Add Comment"

    expect(page).to have_content("New Comment")

    fill_in "Body", with: "This job could be fun"

    click_on "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("This job could be fun")
  end
end
