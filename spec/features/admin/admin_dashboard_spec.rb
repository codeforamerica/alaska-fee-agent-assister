require "rails_helper"

RSpec.feature "Admin viewing dashboard" do
  include PdfHelper

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

    scenario "viewing a pdf" do
      create(:interview, fee_agent_name: "Jessie Tester")
      visit admin_root_path

      click_on "Download"

      temp_file = write_raw_pdf_to_temp_file(source: page.source)
      pdf_values = filled_in_values(temp_file.path)

      # Minimal testing to make sure PDF isn't corrupted
      expect(pdf_values["fa_name"]).to include("Jessie Tester")
    end
  end
end
