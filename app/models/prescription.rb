class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :data_type,
             :counter_cache => true

  belongs_to :patient,
             :counter_cache => true

  belongs_to :doctor,
             :counter_cache => true

  # Indirect associations

  # Validations

end
