require 'rails_helper'

RSpec.describe "user can delete a job" do
  it "does not show up on the jobs page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Artist", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    click_on "Delete"
    
    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN's Artist posting was successfully deleted!")
  end
end
