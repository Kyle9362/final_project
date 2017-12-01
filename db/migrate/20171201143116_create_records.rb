class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :patient_id
      t.integer :prescription_id
      t.datetime :date_time
      t.text :data
      t.integer :datatype_id

      t.timestamps

    end
  end
end
