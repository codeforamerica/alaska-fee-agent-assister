require "rails_helper"

RSpec.feature "Interview for new application", :js do
  scenario "Assisting client with application interview" do
    visit "/"

    click_on "Help someone now", match: :first
  end
end
