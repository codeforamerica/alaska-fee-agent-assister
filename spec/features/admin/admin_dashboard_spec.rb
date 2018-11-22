require "rails_helper"

RSpec.feature "Admin viewing dashboard" do
  context "logged in admin" do
    def basic_auth!
      encoded_login = ["admin:password"].pack("m*")
      page.driver.header "Authorization", "Basic #{encoded_login}"
    end

    before do
      basic_auth!
    end

    scenario "viewing details for an interview" do
      interview = create(:interview)

      visit admin_root_path

      expect(page).to have_content("Interview")

      click_on interview.id

      expect(page).to have_content("Interview ##{interview.id}")
    end

    scenario "searching isn't broken" do
      visit admin_root_path(search: "asdf")

      expect(page).to have_content("Interview")
    end
  end
end
