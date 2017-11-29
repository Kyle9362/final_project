class AddPrescriptionCountToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :prescriptions_count, :integer
  end
end
