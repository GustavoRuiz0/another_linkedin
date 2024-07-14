# frozen_string_literal: true

class RenameTypeColumnInJobs < ActiveRecord::Migration[7.1]
  def change
    rename_column :jobs, :type, :job_type
  end
end
