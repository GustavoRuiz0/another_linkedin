# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :jobs

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length:   { minimum: 10, maximum: 500 }
  validates :contact_email, presence: true, length: { minimum: 8, maximum: 50 },
                            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :contact_phone, presence: true, length: { minimum: 8, maximum: 16 }
end
