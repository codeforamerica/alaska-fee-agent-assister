FactoryBot.define do
  factory :interview do
    trait :with_navigator do
      transient do
        interview_type { nil }
      end

      after(:create) do |interview, evaluator|
        create(:navigator, interview: interview, interview_type: evaluator.interview_type)
      end
    end
  end
end
