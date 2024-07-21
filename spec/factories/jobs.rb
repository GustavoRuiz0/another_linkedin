# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    job_type { 'home office' }
    title { 'Senior python dev' }
    description { 'Senior python dev Senior python dev Senior python dev Senior python dev' }
    salary { rand(2000..15_000) }
    association :company
    location { 'Home office' }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
  end
end
