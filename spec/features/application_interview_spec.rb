require "rails_helper"

RSpec.feature "Interview for new application", :js do
  scenario "Assisting client with application interview" do
    visit "/"

    click_on "Help someone now", match: :first

    expect(page).to have_content "What are you helping the client with today?"
    click_on "Submit an application"

    expect(page).to have_content "How it works"
    click_on "Let's get started"

    expect(page).to have_content "Let's start with the interview"
    click_on "Continue"

    expect(page).to have_content "First, tell us about you, the fee agent"
    fill_in "What is the fee agent's name", with: "Anne Doe"
    fill_in "What is the fee agent's email address", with: "feeagent@example.com"
    fill_in "What is the fee agent's phone number", with: "555-555-5555"
    click_on "Continue"

    expect(page).to have_content "Let's review some of the important details"
    click_on "Continue"
  end
end
