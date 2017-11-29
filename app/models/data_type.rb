class DataType < ApplicationRecord
  # Direct associations

  has_many   :records,
             :foreign_key => "datatype_id",
             :dependent => :destroy

  has_many   :prescriptions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
