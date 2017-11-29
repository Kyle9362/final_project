class AddRecordCountToDataTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :data_types, :records_count, :integer
  end
end
