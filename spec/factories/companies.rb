# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'MICROSOFT' }
    description { 'SOFTWARE BLA BLA MICROSOF BINBOWS' }
    contact_email { FFaker::Internet.email }
    contact_phone { '99999999' }
    created_at { FFaker::Time.date }
    updated_at { FFaker::Time.date }
  end
end
