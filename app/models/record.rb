class Record < ApplicationRecord
  # Direct associations

  belongs_to :datatype,
             :class_name => "DataType",
             :counter_cache => true

  belongs_to :patient,
             :counter_cache => true

  # Indirect associations

  # Validations

end
