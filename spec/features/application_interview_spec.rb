require "rails_helper"

RSpec.feature "Interview for new application", :js do
  scenario "Assisting client with application interview" do
    visit "/"

    click_on "Help someone now", match: :first

    expect(page).to have_content "What are you helping the client with today?"
    click_on "Submit an application"

    expect(page).to have_content "Let's review some of the important details"
    click_on "Continue"
  end
end
