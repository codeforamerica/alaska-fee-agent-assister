require "rails_helper"

RSpec.describe HowItWorksController do
  it_behaves_like "form controller base behavior"
  it_behaves_like "form controller always shows"
end
