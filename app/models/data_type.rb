class DataType < ApplicationRecord
  # Direct associations

  has_many   :prescriptions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
