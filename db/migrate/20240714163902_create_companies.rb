# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string  :name
      t.string  :description
      t.string  :contact_email
      t.string  :contact_phone
      t.timestamps
    end
  end
end
