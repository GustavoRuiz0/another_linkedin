class AddColumnCompanyToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :company, :string
  end
end
