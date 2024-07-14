class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :type, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.decimal :salary, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
