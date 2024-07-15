class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :job_type, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.decimal :salary, null: false
      t.string :location, null: false
      t.references :company, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
