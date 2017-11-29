class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :doctor,
             :counter_cache => true

  # Indirect associations

  # Validations

end
