class AddPrescriptionCountToDataTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :data_types, :prescriptions_count, :integer
  end
end
