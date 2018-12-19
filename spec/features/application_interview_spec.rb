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
    fill_in "What is the fee agent's name", with: "Anne M. FeeAgent"
    fill_in "What is the fee agent's email address", with: "feeagent@example.com"
    fill_in "What is the fee agent's phone number", with: "555-555-5555"
    click_on "Continue"

    expect(page).to have_content "Tell us about the applicant"
    fill_in "What is the applicant's name?", with: "Jane McClient"
    fill_in "What are the last four digits of the applicant's SSN?", with: "1111"
    fill_in "List the name(s) of the person(s) who attended the interview.", with: "Jane"
    click_on "Continue"

    expect(page).to have_content "What program(s) is the applicant applying for?"
    check "Food stamps"
    check "Medicaid"
    check "CAMA"
    click_on "Continue"

    expect(page).to have_content "Take a moment to go over their rights and responsibilities"
    check "Yes"
    click_on "Continue"

    expect(page).to have_content "Is there anyone who is living in the home but is not listed on the application?"
    click_on "Yes"

    expect(page).to have_content "Tell us about the people who live in the home but are not on the application"
    fill_in "List their name(s) and relationship to the applicant.", with: "Meth, RZA, GZA, Raekwon, ODB, Ghostface."
    click_on "Continue"

    expect(page).to have_content "the application who usually lives in the house but is away from home?"
    click_on "Yes"

    expect(page).to have_content "Tell us about the people who live in the house but are away from home."
    fill_in "form[any_away_from_home_names]", with: "Andre 3000 and Big Boi"
    click_on "Continue"

    expect(page).to have_content "Has anyone on the application been convicted of a drug-related felony?"
    click_on "Yes"

    expect(page).to have_content "Tell us about the person who has been convicted of a drug-related felony"
    fill_in "What is the person's name", with: "Annie"
    check "Successfully completed or satisfactorily served a period of probation or parole"
    click_on "Continue"

    expect(page).to have_content "Tell us about the applicant's residency."
    choose "Yes, they have lived outside of Alaska"
    fill_in "When was the applicant's most recent arrival in Alaska?", with: "Two years ago"
    choose "Yes, they intend to remain in Alaska"
    click_on "Continue"

    expect(page).to have_content "Is anyone on the application a member of a federally recognized tribe?"
    click_on "Yes"

    expect(page).to have_content "Tell us about the people who are in a federally recognized tribe."
    fill_in "form[tribe_details]", with: "Damien Marley and Nas"
    click_on "Continue"

    expect(page).to have_content "this application have work that was stopped or reduced within the last 60 days?"
    click_on "Yes"

    expect(page).to have_content "Tell us about work that has stopped or has been reduced in the last 60 days."
    fill_in "form[stopped_work_details]", with: "Yasin Bey and Talib Kweli"
    click_on "Continue"

    expect(page).to have_content "Does the applicant currently have an Alaska Quest Card?"
    click_on "No"

    expect(page).to have_content "Is anyone on the application planning to file a Federal Income Tax Return?"
    click_on "Yes"

    expect(page).to have_content "Tell us about the tax return."
    fill_in "form[filing_tax_return_details]", with: "Lauryn Hill and D'Angelo"
    click_on "Continue"

    expect(page).to have_content "What living expenses does the household pay for?"
    check "Rent/mortgage"
    check "Electricity"
    click_on "Continue"

    expect(page).to have_content "Explain how the household has been supporting itself before applying for assistance."
    fill_in "If the applicant claimed \"no income,\" explain how the expenses have been paid",
            with: "I'm crashing on my friend's couch right now so I don't pay rent"
    click_on "Continue"

    expect(page).to have_content "If applying for CAMA, please list the specific medical need."
    fill_in "form[cama_details]", with: "Tests pass locally, but not on CI. Help me doc."
    click_on "Continue"

    expect(page).to have_content "Any other information that would be helpful for the case worker to know?"
    fill_in "Enter any other information or comments", with: "Mac Miller and Anderson .Paak"
    click_on "Continue"

    expect(page).to have_content "Let's review a few important parts of the application."
    check "form[client_sign_and_date]"
    check "form[fa_sign_and_date]"
    check "form[all_ssns_included]"
    click_on "Continue"

    expect(page).to have_content "Let's review some of the important details"
    click_on "Continue"

    expect(page).to have_content "Great! Now let's go through a few questions to see what other documents are needed."
    click_on "Continue"

    expect(page).to have_content "Is everyone on the application a US citizen?"
    click_on "Yes"

    expect(page).to have_content "Are there any children who live in the home?"
    click_on "Yes"

    expect(page).to have_content "Lastly, let's attach the application and any required documents."
    click_on "Continue"
  end
end
