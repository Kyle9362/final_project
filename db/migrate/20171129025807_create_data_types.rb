class CreateDataTypes < ActiveRecord::Migration
  def change
    create_table :data_types do |t|
      t.string :name
      t.string :data_type
      t.string :description

      t.timestamps

    end
  end
end
