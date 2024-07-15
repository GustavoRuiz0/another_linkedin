# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :company

  validates :job_type, presence: true, length: { minimum: 3, maximum: 30 }
  validates :title, presence: true, length: { minimum: 10, maximum: 60 }
  validates :company, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 30, maximum: 500 }
  validates :salary, presence: true
  validates :location, presence: true, length: { maximum: 50 }
end
