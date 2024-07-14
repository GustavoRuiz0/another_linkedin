class Job < ApplicationRecord
  validates :type,  presence: true, length: { minimum: 3,  maximum: 30 }
  validates :title, presence: true, length: { minimum: 10, maximum: 60 }
  validates :description, presence: true, length: { minimum: 30, maximum: 500 }
  validates :salary, presence: true
  validates :location, presence: true, length: { maximum: 50 }
end
