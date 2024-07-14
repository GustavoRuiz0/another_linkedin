FactoryBot.define do
  factory :job do
    type { 'Home Office' }
    title { 'Senior python dev' }
    description { 'Senior python dev Senior python dev Senior python dev Senior python dev' }
    salary { rand(2000..15_000) }
    location { 'Home office' }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
  end
end
