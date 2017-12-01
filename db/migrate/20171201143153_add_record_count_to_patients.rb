class AddRecordCountToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :records_count, :integer
  end
end
