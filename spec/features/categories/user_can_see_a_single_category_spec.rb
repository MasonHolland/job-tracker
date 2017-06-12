require 'rails_helper'

RSpec.describe "user can view a category" do
  it "all jobs are listed" do
    category = Category.create!(title: "Fun")
    company = Company.create(name: "Dutch Boys Toys")
    job_1 = category.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company_id: company.id)
    job_2 = category.jobs.create!(title: "Artist", level_of_interest: 20, city: "Perth", company_id: company.id)

    visit category_path(category)

    expect(page).to have_content("Developer")
    expect(page).to have_content("Artist")
  end
end
